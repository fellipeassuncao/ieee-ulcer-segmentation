% clear all;
% close all;
% currentFolder = pwd;
% addpath(genpath(currentFolder))
% 
% [img, gray] =  imread("sem_reflexo.jpg");
% nC = 200;
% lambdaprime = 0.5;
% sigma = 5.0;
% conn8 = 1;
% path_labels = "labels.pgm";
% path_borders ="borders.pgm";

function ers(img, nC, lambdaprime, sigma, conn8, path_labels, path_borders)
    %img = imread(img);
    % Function code
    t = cputime;
    % Our implementation can take both color and grey scale images.
    % gray_img = double(rgb2gray(img));
    % For color imagens
    labels = mex_ers(double(img),nC,lambdaprime,sigma,conn8);
    
    % For grey scale image
    %labels = mex_ers(gray_img,nC,lambdaprime,sigma,conn8);
    fprintf(1,'Use %f sec. \n',cputime-t);
    
    % relate superpixels number
    number = length(unique(labels));
    fprintf("Numero de  %d",number)
    
    % create borders 
    mask = boundarymask(labels);

%     % visualize images 
      imshow(labels,[0 199])
      labelsRange = getframe;

%     imshow(labels,'DisplayRange',[0 199])
%     imshow(labels)
    
%     %randomly color the superpixels
%     out = random_color( double(gray_img) ,labels,nC);
%     % save labels
    imwrite(labelsRange.cdata, path_labels);
%     imwrite(labels, path_labels, 'MaxValue',199);
%     % save boundary map
    imwrite(mask, path_borders);

    disp('ERS Labels and Borders saved with success');
end