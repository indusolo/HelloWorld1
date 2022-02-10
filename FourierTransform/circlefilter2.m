Img1 = imread('tiger.jpg');
Img1 =  imresize(Img1,[400,600]);
Img1 = rgb2gray(Img1);
figure;imshow(Img1);
imF1 = fft2(double(Img1));
imF1 = fftshift(imF1);
%imF1=log2(imF1);

R1 = abs(imF1);
Ang = angle(imF1);

A= zeros(400,600);




%for r = 10:10:190
r = 150;

for k= 200-r:1:200+r
    for j =300-r:1:300+r
        
        if ((k - 200)^2 +(j-300)^2 <= r^2)
            A(k,j) = 1;
            
        end
    end
end

R2 = R1.*A;

Z1 = R2.*exp(i*(Ang));

Rimg1 = ifft2(Z1);
figure;imshow((uint8(abs(Rimg1))))
title('Radius = 150')


