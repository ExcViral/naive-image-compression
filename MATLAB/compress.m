clc;
clear all;

% input image
I = imread('');
figure("Name","Input Image"); imshow(I);

% SVD decomposition of input image
[U,S,V] = svd(double(I));

% algorithm of image compression
img_size = size(I);
new_S = S;
compression_level = 200;
for k=0:compression_level
   new_S(img_size(1)-k,img_size(2)-k) = 0;
end

% reconstruction of image
new_I = uint8(U*new_S*V');
figure("Name","Compressed Image"); imshow(new_I);
