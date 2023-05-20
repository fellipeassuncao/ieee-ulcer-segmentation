%// SH

close all;clear all;clc

%disp('SH');
addpath 'C:\Users\felip\Desktop\Projetos\main-ms-felipe\src\main\java\com\rodolfo\ulcer\segmentation\repositories\sh'

%//=======================================================================
%// Input
%//=======================================================================

dir_data = dir("C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\sh\");

for i=3:size(dir_data)
    img_name = dir_data(i).name;
    img_path = "C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\sh\"+img_name+"\";
    img = imread(img_path+"\"+img_name+"_01_WITHOUT_REFLECTIONS.jpg");
  
    %imwrite(img,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\ulcer\"+img_name+".jpg");
    %img_lb = imread(img_path+"\"+img_name+"_02_LABELED_RESAMPLE.jpg");
    %imwrite(img_lb,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\non_ulcer\"+img_name+".jpg");
    nC = 200;
    path_labels = img_path+"labels.pgm";
    path_borders = img_path+"borders.pgm";
    tic; 
    sh(img,nC,path_labels,path_borders);
    toc;
end

	