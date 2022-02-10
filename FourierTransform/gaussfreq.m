

Img1 = imread('castle.jpg');
Img1 =  imresize(Img1,[400,600]);
Img1 = rgb2gray(Img1);
figure;imshow(Img1);
imF1 = fft2(double(Img1));
imF1 = fftshift(imF1);
%imF1=log2(imF1);

R1 = abs(imF1);
Ang = angle(imF1);

[M N ] = size(Img1); % Take the size of image
gfilter=zeros(M,N);
sigma=20; % Sigma Values for Gaussian Filter
    for k = 1:M
            for j = 1:N
		    dist= (k-M/2)^2 + (j-N/2)^2;
		    gfilter(k,j) = 1*exp(-(dist)/(2*(sigma)^2));
            end
    end
imshow(gfilter)


R2 = R1.*gfilter;

Z1 = R2.*exp(i*(Ang));

Rimg1 = ifft2(Z1);
Fcor = corr2(Img1,abs(Rimg1))
figure;imshow((uint8(abs(Rimg1))))
title(['Gaussian Filter, Correlation coeff = ', num2str(Fcor)])

H = fspecial('disk',7);
filtered = imfilter(Img1,H,'replicate');
Scor = corr2(Img1,filtered)

figure;imshow((uint8((filtered))))
title(['Averaging Filter, Correlation coeff = ',num2str(Scor)])





