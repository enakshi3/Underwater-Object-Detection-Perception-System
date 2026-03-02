
clear all;
clc;
close all;
img=imread('3.jpg');
figure;imshow(img);
red = img(:,:,1); % Red channel
figure;
imshow(red);
figure;
imhist(red);
b= histeq(red);
figure;imshow(b);

C = imfuse(img,b,'blend','Scaling','joint');
figure;imshow(C);
d= imadjust(C,[0.2 0.8],[]);
figure;imshow(d);


srgb2lab = makecform('srgb2lab');
lab2srgb = makecform('lab2srgb');
shadow=img;
shadow_lab = applycform(shadow, srgb2lab); % convert to L*a*b*

% the values of luminosity can span a range from 0 to 100; scale them
% to [0 1] range (appropriate for MATLAB(R) intensity images of class double) 
% before applying the three contrast enhancement techniques
max_luminosity = 100;
L = shadow_lab(:,:,1)/max_luminosity;

% % % % % % % % % % % % % % % % % % % % % % % % GREY WORLD% % % % % % % % % % % % % % % % 
% replace the luminosity layer with the processed data and then convert
% the image back to the RGB colorspace


Grey_Edge = shadow_lab;
Grey_Edge(:,:,1) = imadjust(L)*max_luminosity;
Grey_Edge = applycform(Grey_Edge, lab2srgb);
Max_RGB = max(C,100);
Hist = Max_RGB;
Hist(:,:,1) = histeq(L)*max_luminosity;
Hist = applycform(Hist, lab2srgb);

Adaptive = Hist;
Adaptive(:,:,1) = adapthisteq(L)*max_luminosity;
Adaptive = applycform(Adaptive, lab2srgb);




Balance = rgb2gray(Adaptive); % Convert to gray so we can get the mean luminance.
% Extract the individual red, green, and blue color channels.
redChannel = C(:, :, 1);
greenChannel = C(:, :, 2);
blueChannel = C(:, :, 3);
meanR = mean2(redChannel);
meanG = mean2(greenChannel);
meanB = mean2(blueChannel);
meanGray = mean2(Balance);

% Make all channels have the same mean
redChannel = uint8(double(redChannel) * meanGray / meanR);
greenChannel = uint8(double(greenChannel) * meanGray / meanG);
blueChannel = uint8(double(blueChannel) * meanGray / meanB);
% Recombine separate color channels into a single, true color RGB image.
white = cat(3, redChannel, greenChannel, blueChannel);
% 
figure;
subplot(2,5,1),imshow(img);
title('Original Image');
subplot(2,5,2),imshow(red);
title('Red Channel');
subplot(2,5,3),imshow(b);
title('Red Equalized');
subplot(2,5,4),imshow(C);
title('Original with Equalized');
subplot(2,5,5),imshow(d);
title('Compensated Image');  

subplot(2,5,6),imshow(Grey_Edge);
title('Grey Edge');

subplot(2,5,7),imshow(Max_RGB);
title('Max RGB');
subplot(2,5,8),imshow(Hist);
title('Histogram Equalized');
subplot(2,5,9),imshow(Adaptive);
title('Adaptive Histogram');
subplot(2,5,10),imshow(white);
title('White Balanced Image');

Err = 0;
if nargin >2
    GammaValue = 0;
    disp('Default value for gamma = 1');
    Err=1;
else if nargin==2& GammaValue<0
    GammaValue = 1;
    disp('GammaValue < 0, Default value considered, Gammavalue = 1');
    
else if nargin<2
   disp('Error : Too many input parameters');
    Err = 1;
    end
    end
end
if Err == 1 
x = white;
x = double(x);
Correction = 255 * (x/255).^ 14;

end
figure;
imshow(Correction);

