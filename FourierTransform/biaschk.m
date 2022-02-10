clear all
close all
I=imread('garden.jpg');
I = rgb2gray(I);
index1 = 0;
index2 = 0;
%figure; image(I);colormap(gray);axis off
F = zeros(5,5);
%k = -1;l =2
for k=-2:1:2
   
    for l = -2:1:2
for a = 1:1:10
    for b = 1:1:10
         F(a,b) = exp((-i*2*pi)*(k*a/10+l*b/10));%
    end
end
% % figure;
% % imagesc(abs(log2(F)));colormap('gray');axis off;
index2=index2+1;
subplot(5,5,index2);
imagesc(abs(log2(F)));colormap('gray');axis off;

    end
end

%image(abs(log2(F)));colormap('gray');axis off;