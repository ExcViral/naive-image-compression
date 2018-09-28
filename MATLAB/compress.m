clc;
clear all;

% fill in the image name here
I = imread('imageName.imageFormat');
imshow(I);

% SVD decomposition of image
[U,S,V] = svd(double(I));

% algorithm of image comression


