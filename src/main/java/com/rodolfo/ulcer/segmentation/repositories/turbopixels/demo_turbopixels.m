% Runs the superpixel code on the lizard image
clear all;
close all;
addpath('lsmlib');

img = imread('sem_reflexo.jpg');
numSuperpixels = 200;
timeStep = 0.5;
maxIterations = 400;
display_int = 0;
contour_color = white;
path_labels = "labels.pgm";
path_borders ="borders.pgm";
% 200 superpixels
tic;
turbopixels(img, numSuperpixels, timeStep, display_int, contour_color, path_labels, path_borders)
toc;
%imagesc(disp_img);
