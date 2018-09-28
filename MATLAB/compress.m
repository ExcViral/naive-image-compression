clc;
clear all;

% Enter the input image here
I = imread('');
figure("Name","Input Image"); imshow(I);

% Compress the image, input image, and compression level
c_I = compresss(I, 200);
figure("Name","Compressed Image"); imshow(c_I);

% function to compress input image I
function compressed_img = compresss(I, compression_level)
    % SVD decomposition of input image
    [U,Sigma,V] = svd(double(I));
    new_S = trim_sigma(Sigma, compression_level);
    compressed_img = reconstruct(U, new_S, V);
end

% function to trim n+1 lower order eigen values
function new_sigma = trim_sigma(sigma, compression_level)
    new_sigma = sigma;
    for k=0:compression_level
        new_sigma(size(sigma,1)-k,size(sigma,2)-k) = 0;
    end 
end

% function to reconstruct the image after compression
function reconstructed_Image = reconstruct(U, Sigma, V)
    reconstructed_Image = uint8(U*Sigma*V');
end