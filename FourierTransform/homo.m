% MATLAB code that performs Homomorphic filtering, Using Gaussian
% High Pass Filter for performing filtering.
% Date of Execution 13-july-2009. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
clear all
tic
d=10;
p=imread('scene2.jpg');  %Read an image
r=rgb2gray(p);
im=double(r);  
subplot(121),imshow(im./255);
%figure(1),imshow(im./255)
[r c]=size(im);
%%%%%%%%%%Gaussian high pass filter %%%%%%%%%%%%%%
A=zeros(r,c);
for i=1:r
    for j=1:c
        A(i,j)=(((i-r/2).^2+(j-c/2).^2)).^(.5);
        B(i,j)=A(i,j)*A(i,j);
        H(i,j)=(1-exp(-((B(i,j)).^2/d.^2)));
    end
end
%%%%%%%%%%%%%Using it for my application as homomorphic filtering is
%%%%%%%%%%%%%application specific, taking the value of rL and rH
%%%%%%%%%%%%%values accordingly.
rL=.0999;
rH=1.01;
H=((rH-rL).*H)+rL;
%%%%%log of image
im_l=log2(im);
%%%%%DFT of logged image
im_f=fft2(im_l);
%%%%%Filter Applying DFT image
im_nf=H.*im_f;
%%%%Inverse DFT of filtered image
im_n=abs(ifft2(im_nf));
%%%%%Inverse log 
im_e=exp(im_n);
% subplot(1,2,2);
subplot(122),imshow((im_e),[])
%figure(2),imshow((im_e),[])
toc
%figure(3), imshow(H)