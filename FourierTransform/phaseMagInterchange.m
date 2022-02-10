Img1 = imread('castle.jpg');
Img1 = rgb2gray(Img1);
Img1 = imresize(Img1,[600,800]);
figure;imshow(Img1);
imF1 = fft2(double(Img1));
imF1 = fftshift(imF1);
R1 = abs(imF1);
A1 = angle(imF1);


Img2 = imread('tiger.jpg');
Img2 = rgb2gray(Img2);
Img2 = imresize(Img2,[600,800]);
figure;imshow(Img2)
imF2 = fft2(double(Img2));
imF2 = fftshift(imF2);
R2 = abs(imF2);
A2 = angle(imF2);

Z1 = R1.*exp(i*(A2));
Z2 = R2.*exp(i*A1);

Rimg1 = ifft2(Z1);
Rimg2 = ifft2(Z2);


figure;imshow(uint8(Rimg1))
figure;imshow(uint8(Rimg2))



