package com.rodolfo.ulcer.segmentation.core.preprocessing.superpixels;

//import java.io.*;
//import com.rodolfo.ulcer.segmentation.process.*;
import com.rodolfo.ulcer.segmentation.models.Image;
import com.rodolfo.ulcer.segmentation.opencv.OpenCV;

import com.rodolfo.ulcer.segmentation.repositories.ImageRepository;

import org.bytedeco.javacpp.opencv_core;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SuperpixelsERS extends Superpixels {
    // Criar objeto da classe Superpixel
    public SuperpixelsERS(Image image, Integer imageEdge, Integer iterations, Integer amount, Integer seeds) {

        super(image, imageEdge, iterations, amount, seeds);
    }

    @Override
    public void createSuperpixels() {
        
        log.info("Segmentando a imagem em superpixel com o método ERS");

        String caminho = this.image.getDirectory().getDirPath().getAbsolutePath().concat("\\");
        //System.out.println(caminho);
        // Instanciar para usar o método de abrir a imagem
        ImageRepository imageRepository = new ImageRepository();
        imageRepository.save(this.image.getImageWithoutReflection(), caminho.concat("sem_reflexo.jpg"));

        /**
         * CHAMAR O ERS POR LINHA DE COMANDO
         * como parâmetro informar o caminho de onde ele deve salvar a imagem (caminho acima)
         * como parâmetro informar o caminho da imagem que ele deve abrir (caminho.concat("sem_reflexo.jpg"))
         
        Process proc;
        try {
            proc = Runtime.getRuntime().exec(
                new String[]{
                    "C:/repositories/ers-teste/ers.exe",
                    caminho.concat("sem_reflexo.jpg"),
                    String.valueOf(200),
                    String.valueOf(0.5),
                    String.valueOf(5),
                    String.valueOf(1),
                    caminho.concat("labels.pgm"),
                    caminho.concat("borders.pgm")
                }
            );
            
            proc.waitFor();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       */
       // Atribuir as imagens geradas pelo ERS
       this.labels = imageRepository.open(caminho.concat("labels.pgm"));
       this.contour = imageRepository.open(caminho.concat("borders.pgm"));
       this.labels = OpenCV.matImage2GRAY(this.labels);
       this.contour = OpenCV.matImage2GRAY(this.contour);

       // this.iterations = iterations;
       this.superpixelsAmount = amount;
       log.info("Quantidade de superpixels formado na image: '{}'", this.superpixelsAmount);
       
       // Verifica se a imagem pode ser aberta pelo método
       //OpenCV.dump(imageRepository.open(caminho.concat("labels.pgm")));
       //OpenCV.dump(this.labels);

       // Extração de features
       this.labels.convertTo(this.labels, opencv_core.CV_32SC1);
       this.makeContourImage();
       this.makeSuperpixelsSegmentation();
    }
}
// mvn clean install
// mvn exec:java -Dexec.mainClass="com.rodolfo.ulcer.segmentation.Main"