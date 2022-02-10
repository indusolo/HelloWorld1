clear all;
close all;

% Prewitt operator
% Prewitt vertical operator
P_v = [-1 0 1;-1 0 1;-1 0 1];
% Prewitt horizontal operator
P_h = [-1 -1 -1;0 0 0;1 1 1];

% Read the image
Img = imread('img7.jpg');

% Convert to gray
Img_gray = rgb2gray(Img);

E_v = conv2(double(Img_gray),P_v,'same');

E_h = conv2(double(Img_gray),P_h,'same');
imshow(Img_gray);
figure;
imshow(uint8(E_v))
figure;
imshow(uint8(E_h))
