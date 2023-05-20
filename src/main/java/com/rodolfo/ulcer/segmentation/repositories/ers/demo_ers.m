%// Entropy Rate Superpixel Segmentation

close all;clear all;clc

%disp('Entropy Rate Superpixel Segmentation');
addpath 'C:\Users\felip\Desktop\Projetos\main-ms-felipe\src\main\java\com\rodolfo\ulcer\segmentation\repositories\ers'


%//=======================================================================
%// Input
%//=======================================================================

dir_data = dir("C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\tests\ers\");
img = imread("sem_reflexo.jpg");

for i=3:size(dir_data)
    
    img_name = dir_data(i).name;
    img_path = "C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\tests\ers\"+img_name+"\";
    img = imread(img_path+"\"+img_name+"_01_WITHOUT_REFLECTIONS.jpg");
    %imwrite(img,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\ulcer\"+img_name+".jpg");
    %img_lb = imread(img_path+"\"+img_name+"_02_LABELED_RESAMPLE.jpg");
    %imwrite(img_lb,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\non_ulcer\"+img_name+".jpg");
    nC = 200;
    lambdaprime = 0.5;
    sigma = 5.0;
    conn8 = 1;
    %path_labels = "labels.pgm";
    %path_borders ="borders.pgm";
    path_labels = img_path+"labels.pgm";
    path_borders = img_path+"borders.pgm";
    
    ers(img, nC, lambdaprime, sigma, conn8, path_labels, path_borders);

end

	