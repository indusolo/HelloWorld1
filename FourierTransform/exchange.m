close all
clear all

I=imread('art2.jpg');
I = rgb2gray(I);
figure;imshow(I)
F=fft2(double(I));
S=fftshift(F);
L=log2(S);
A=abs(L);
T1 = angle(S);
R1= real(log2(S));

figure;
imagesc((R1));colormap(gray);
axis off
figure;
imagesc(T1);colormap(gray)
axis off

