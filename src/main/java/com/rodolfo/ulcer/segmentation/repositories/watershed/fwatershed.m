function fwaterhsed(img,conn,path_labels,path_borders)    
    img_gray = rgb2gray(img);
    tic; 
    labels = watershed(img_gray, conn);
    toc;
    % relate superpixels number
    number = length(unique(labels));
    fprintf("Superpixel number %d",number)
    % create borders
    mask = boundarymask(labels);

    %//=======================================================================
    %// Save and iisualize images
    %//=======================================================================
    % visualize images 
    imshow(labels,[0 950])
    %imshow(labels)
    labels = getframe;
    % save labels
    imwrite(double(labels),path_labels);
    % save borders
    imwrite(mask,path_borders);  

    disp('Labels and Borders saved with success');
end