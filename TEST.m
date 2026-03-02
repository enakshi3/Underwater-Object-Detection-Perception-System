clc;
close all;
img=imread('image2.jpg');
figure;imshow(img);
a=rgb2gray(img);
figure,imshow(a);
imhist(a)
 b=imadjust(a,[0.196 0.784],[0.0 1.0]);
 figure;imshow(b);
 figure;imhist(b);
 figure,imshow(b);
% imhist(b);
% c=histeq(b);
% subplot(1,3,1),imshow(a);
% 
% subplot(1,3,2),imshow(b);
% subplot(1,3,3),imshow(c);