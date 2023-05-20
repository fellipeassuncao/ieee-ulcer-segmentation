% Compute the superpixels given an image.
% img - the input image. Either RGB or Grayscale. Must be double in range
% 0..1
% numSuperpixels - number of superpixels
% display_int - Interval of frames at which the progress of the evolution
% will be displayed. 0 if not display is needed (default).
% contour_color - color of the superpixel boundaries (default is red)
%
% Returns:
%     phi - the final evolved height function
%     boundary - a logical array representing superpixel boundaries
%     disp_img - the image with the boundaries overlaid on top of the image
%     frames - frames of the evolution in Matlab movie format if
%     display_int was above 0 and output frames parameter was given.
function turbopixels(img,numSuperpixels,timeStep,display_int,contour_color,path_labels,path_borders)
    
    phi = evolve_height_function_N(img, timeStep, maxIterations, 'superpixels', display_int, [], numSuperpixels);
    smooth_img = evolve_height_function_N(rgb2gray(img), 0.1, 10, 'curvature', 0, 0);
    smooth_img = evolve_height_function_N(img, 0.1, 10, 'curvature', 0, 0);


    [gx,gy] = height_function_der(255*smooth_img);
    mag = sqrt(gx.^2 + gy.^2);
    speed2 = exp(- mag/5);
    boundary = get_superpixel_boundaries(phi,speed2);
    disp_img = display_logical(img, boundary, contour_color);
    
end
    