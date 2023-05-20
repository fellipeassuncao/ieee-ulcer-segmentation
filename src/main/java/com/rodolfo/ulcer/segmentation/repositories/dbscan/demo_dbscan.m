%// DBSCAN

close all;clear all;clc

%disp('DBSCAN');
addpath 'C:\Users\felip\Desktop\Projetos\main-ms-felipe\src\main\java\com\rodolfo\ulcer\segmentation\repositories\dbscan'

%//=======================================================================
%// Input
%//=======================================================================

dir_data = dir("C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\dbscan\");

for i=3:size(dir_data)
    img_name = dir_data(i).name;
    img_path = "C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\dbscan\"+img_name+"\";
    img = imread(img_path+"\"+img_name+"_01_WITHOUT_REFLECTIONS.jpg");
  
    %imwrite(img,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\ulcer\"+img_name+".jpg");
    %img_lb = imread(img_path+"\"+img_name+"_02_LABELED_RESAMPLE.jpg");
    %imwrite(img_lb,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\non_ulcer\"+img_name+".jpg");
    nC = 200;
    post = 1;
    path_labels = img_path+"labels.pgm";
    path_borders = img_path+"borders.pgm";
    tic; 
    dbscan(img, nC ,post, path_labels, path_borders);
    toc;
end

	