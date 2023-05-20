/* This sample code shows how calling ergc functions
 * It can also be used as a standalone
 * It covers many usual cases: 
 * - 2D/3D images of any number of channels
 * - seeds given OR placed on a grid (grid can be customed)
 * In case of given seeds image, background must have -1 value, and seeds be numbered from 0 to n
 */


#include <CImg.h>
#include <iostream>
#include <string>
#include "ergc.h"
using namespace cimg_library;
using namespace std;

int main(int argc, char** argv) {


  cimg_usage("Computes superpixels/supervoxels/diffusion on any given image");


  // inputs
  string nim=string(cimg_option("-i","","Input image file"));
  int n=cimg_option("-n",400,"Number of desired superpixels/supervoxels");
  int dx=cimg_option("-dx",-1,"Seeds sampling wrt axis x (for custom grids)");
  int dy=cimg_option("-dy",-1,"Seeds sampling wrt axis y (for custom grids)");
  int dz=cimg_option("-dz",-1,"Seeds sampling wrt axis z (for custom grids)");
  bool rgbtolab=cimg_option("-rgb2lab",true,"Convert RGB to Lab colorspace");
  string nis=string(cimg_option("-is","","Input seeds image file"));
  bool perturb=cimg_option("-p",true,"Perturb seeds wrt a perturb map (default: gradient map used)");
  int m=cimg_option("-m",0,"Compacity value");
  int verb=cimg_option("-v",0,"verbose mode");
  // outputs
  string ol=string(cimg_option("-ol","","Output Labeled image file"));
  string osp=string(cimg_option("-osp","","Output SuperPixels image file"));
  string ospo=string(cimg_option("-ospo","","Output borders of SuperPixels with Original image as background"));
  string od=string(cimg_option("-od","","Output Distance image file"));


  if(nim=="") return 0;

  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  CImg<> inputim(nim.c_str());
  CImg<> im=inputim; // copy inputim (to avoid some small translations errors with rgb2lab and lab2rgb)

  // useful variables
  CImg<> distances;
  CImg<int> states, seeds;
  vector<SP*> SPs;

  // convert to Lab if needed (better superpixels with color images)
  if(im.spectrum()== 3) if(rgbtolab) im.RGBtoLab();


  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  // 1. dealing with seeds
  if(nis!="") { // input seeds given 

    // no perturbation of seeds is performed
    // use parameter m at your own risk !
    seeds.load(nis.c_str());

    // call to initialize_images function that initializes :
    // - distances image
    // - states image
    // according to input seeds image
    initialize_images(seeds, distances, states);

    SPs=initialize_regions(im, seeds);



  } else { // seeds placed on a grid



    int nsp=0; // number of placed seeds

    CImg<> gradient;
    if(perturb) gradient=compute_gradient(im); 
    // in this code, perturb map is the gradient map. It can be your own custom perturb map.

    // dealing with grid seeds
    if(im.depth()==1) { // 2d case
      if((dx>1) && (dy>1)) // custom grid
	nsp=placeSeedsOnCustomGrid2d(im.width(),im.height(),dx,dy,seeds);	
      else // regular grid
	nsp=placeSeedsOnRegularGrid2d(im.width(),im.height(),n,seeds);

    } else { // 3d case
      if((dx>1) && (dy>1) && (dz>1)) // custom grid
	nsp=placeSeedsOnCustomGrid3d(im.width(),im.height(),im.depth(),dx,dy,dz,seeds);	
      else // regular grid
	nsp=placeSeedsOnRegularGrid3d(im.width(),im.height(),im.depth(),n,seeds);
    }

    if(perturb) {
      CImg<int> perturbedSeeds;
      if(im.depth()==1)
	perturbSeeds2d(seeds,gradient,perturbedSeeds);
      else
	perturbSeeds3d(seeds,gradient,perturbedSeeds);
      seeds=perturbedSeeds;
    }


    if(verb) cout<<"Number of seeds: "<<nsp<<endl;

    initialize_images(seeds, distances, states);
    SPs=initialize_superpixels(im,seeds);
  }



  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  // 2. go with diffusion function
  if(im.depth()==1) // 2D gray case
    fmm2d(distances, seeds, states, im, SPs, m);
  else // 3D gray case
    fmm3d(distances, seeds, states, im, SPs, m);







  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  // 3. outputs

  // Output Label image (main output for many applications)
  if(ol!="") seeds.save(ol.c_str());


  // Output Distance image
  if(od!="") distances.save(od.c_str());


  // Output SuperPixels image (pixels values have been replaced by the mean color of the superpixel they belong to)
  if(osp!="") {
    CImg<> output; output.resize(im.width(),im.height(),im.depth(),im.spectrum());

    // affect meancolor to each superpixel
    cimg_forXYZC(output,x,y,z,c)
      output(x,y,z,c) = SPs[seeds(x,y,z)]->meanColor(0,0,0,c);
    if(im.spectrum()==3) if(rgbtolab) output.LabtoRGB();
    output.save(osp.c_str());
  }


  // Output borders of SuperPixels with Original image as background
  // Draw borders in a slice by slice fashion for 3d images
  if(ospo!="") {
    CImg<> output=inputim;
    int v4x[]={-1,0,1,0};
    int v4y[]={0,-1,0,1};

    cimg_forZ(im,z) {
      cimg_forXY(output,x,y) {
	int lab1=seeds(x,y,z);
	for(int k=0;k<4;k++)
	  if(output.containsXYZC(x+v4x[k],y+v4y[k],z))
	    if(lab1 != seeds(x+v4x[k],y+v4y[k],z))
	      cimg_forC(output,c)
		output(x,y,z,c)=0;
      }
    }
    output.save(ospo.c_str());
  }



  // 
  for(unsigned int k=0; k<SPs.size(); k++)
    delete SPs[k];




  return 1;
}
