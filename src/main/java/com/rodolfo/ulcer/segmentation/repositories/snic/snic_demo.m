%// SNIC

close all;clear all;clc

%disp('SNIC');
addpath 'C:\Users\felip\Desktop\Projetos\main-ms-felipe\src\main\java\com\rodolfo\ulcer\segmentation\repositories\snic'


%//=======================================================================
%// Input
%//=======================================================================

dir_data = dir("C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\tests\snic\");
img = imread("sem_reflexo.jpg");

for i=3:size(dir_data)
    
    img_name = dir_data(i).name;
    img_path = "C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\tests\snic\"+img_name+"\";
    img = imread(img_path+"\"+img_name+"_01_WITHOUT_REFLECTIONS.jpg");
    %imwrite(img,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\ulcer\"+img_name+".jpg");
    %img_lb = imread(img_path+"\"+img_name+"_02_LABELED_RESAMPLE.jpg");
    %imwrite(img_lb,"C:\Users\felip\Desktop\Projetos\main-ms-felipe\files\database\training\cnn\non_ulcer\"+img_name+".jpg");
    [height, width, colors] = size(img);
    nC = 200;
    compactness = 20.0;
    [labels, numlabels] = snic_mex(img,nC,compactness);
    
        % relate superpixels number
    number = length(unique(labels));
    fprintf("Superpixel number %d",number)
    fprintf("Número de Superpixels SNIC: %d \n",numlabels);  
    
    path_labels = img_path+"labels.pgm";
    path_borders = img_path+"borders.pgm";
    
    % create borders 
    mask = boundarymask(labels);
    
    % visualize images 
    imshow(labels,[0 199])
    labels = getframe;
    
    % save labels
    imwrite(labels.cdata, path_labels);
    % save boundary map
    imwrite(mask, path_borders);

end



% 
% [height, width, colors] = size(img);
% tic;
% %-------------------------------------------------
% numsuperpixels = 200;
% compactness = 20.0;
% [labels, numlabels] = snic_mex(img,numsuperpixels,compactness);
% 
% %-------------------------------------------------
% timetaken = toc;
% disp(num2str(timetaken));
% imagesc(labels);
% %imwrite(double(labels),"labels.jpg");