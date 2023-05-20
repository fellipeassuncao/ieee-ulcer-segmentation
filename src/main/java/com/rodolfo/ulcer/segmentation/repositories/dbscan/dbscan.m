%======================================================================
% DBSCAN demo in TIP 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % J. Shen, X. Hao, Z. Liang, Y. Liu, W. Wang, and L. Shao, 
% % Real-time Superpixel Segmentation by DBSCAN Clustering Algorithm, 
% % IEEE Trans. on Image Processing, 25(12):5933-5942, 2016 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2016  Beijing Laboratory of Intelligent Information Technology
% Any further questions, please send email to: shenjianbing@bit.edu.cn  or shenjianbingcg@gmail.com
%======================================================================
%Input parameters are: 
%[1] 8 bit images (color)
%[2] Number of required superpixels (optional, default is 200)
%[3] post processing(1 is need,0 is not)
%Ouputs are:
%[1] labels (in raster scan order)

%NOTES:
%[1] number of returned superpixels may be different from the input
%number of superpixels.
%[2] you should compile the cpp file using visual studio 2008 or later version
% -- mex DBscan_mex.cpp 
%======================================================================

function dbscan(img,nC,post,path_labels,path_borders)    
    img_gray = rgb2gray(img);
    tic; 
    labels = DBscan_mex(img_gray, nC, post);
    toc;
    % create borders
    mask = boundarymask(labels);

    %//=======================================================================
    %// Save and visualize images
    %//=======================================================================
    % visualize images 
    imshow(labels,[0 199])
    labels = getframe;
    % save labels
    imwrite(labels.cdata,path_labels);
    % save borders
    imwrite(mask,path_borders);  
    disp('Labels and Borders saved with success');
end

