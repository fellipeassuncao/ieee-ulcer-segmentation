#include <CImg.h>
#include <iostream>
#include <string>
#include "ergc.h"
#include "timer.h"
using namespace cimg_library;
using namespace std;

int main(int argc, char** argv) {


  cimg_usage("Example of iterative oversegmentation refinement");

  // inputs
  string nim=string(cimg_option("-i","","Input image file"));
  int n=cimg_option("-n",400,"Initial number of desired superpixels");
  int nr=cimg_option("-nr",5,"Number of refinement steps");
  bool rgbtolab=cimg_option("-rgb2lab",true,"Convert RGB to Lab colorspace");
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
  // initialize seeds
  int nsp=placeSeedsOnRegularGrid2d(im.width(),im.height(),n,seeds);

  CImg<> gradient=compute_gradient(im); 
  CImg<int> perturbedSeeds;
  perturbSeeds2d(seeds,gradient,perturbedSeeds);
  seeds=perturbedSeeds;    

  if(verb) cout<<"Number of seeds: "<<nsp<<endl;

  // initialize images and superpixels list
  initialize_images(seeds, distances, states);
  SPs=initialize_superpixels(im,seeds);


  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  // diffusion
  fmm2d(distances, seeds, states, im, SPs, m);



  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  // iteratively refinement
  for(int k=0;k<nr;k++) {
    tic();
    addNewSeed(distances, seeds, states, im, SPs);
    // the new superpixel is added at the end of the list :
    cout<<"* Added seed @("<<SPs[SPs.size()-1]->xs<<","<<SPs[SPs.size()-1]->ys<<")";
    fmm2d(distances, seeds, states, im, SPs, m);
    cout<<"\tProcessing time : "<<toc()<<endl;
  }






  /////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
  // outputs

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
  if(ospo!="") {
    CImg<> output=inputim;
    int v4x[]={-1,0,1,0};
    int v4y[]={0,-1,0,1};

    cimg_forXY(output,x,y) {
      int lab1=seeds(x,y);
      for(int k=0;k<4;k++)
	if(output.containsXYZC(x+v4x[k],y+v4y[k]))
	  if(lab1 != seeds(x+v4x[k],y+v4y[k]))
	    cimg_forC(output,c)
	      output(x,y,0,c)=0;
    }
    output.save(ospo.c_str());
  }


  return 1;
}
