clc 
clear all
close all
%%
x = imread('lena.jpg');
x1 = rgb2gray(x);
x2 = imnoise(x1,'salt & pepper',0.9);
[I,rect] = SRAD(x1,20,0.025, [0 0 436 182]);
B = imguidedfilter(I);

figure
subplot(3,1,1)
imshow(x1); title('original image');
subplot(3,1,2)
imshow(x2); title(' noisy image ');
subplot(3,1,3)
imshow(B); title(' denoise image ');



