Img1 = imread('scene2.jpg');
Img1 =  imresize(Img1,[400,600]);
Img1 = double(rgb2gray(Img1));
figure;imshow(uint8(Img1));
d=10;

LogIm = log2(Img1+1);
imF1 = fft2((LogIm));
imF1 = fftshift(imF1);
%imF1=log2(imF1);

R1 = abs(imF1);
Ang = angle(imF1);

% % % % [M N ] = size(Img1); % Take the size of image
% % % % gfilter=zeros(M,N);
% % % % sigma=30; % Sigma Values for Gaussian Filter
% % % %     for k = 1:M
% % % %             for j = 1:N
% % % % 		    dist= (k-M/2)^2 + (j-N/2)^2;
% % % % 		    gfilter(k,j) = 1*exp(-(dist)/(2*(sigma)^2));
% % % %             end
% % % %     end
[r,c] = size(Img1);  
A=zeros(r,c);

    for k=1:r
    for j=1:c
        A(k,j)=(((k-r/2).^2+(j-c/2).^2)).^(.5);
        B(k,j)=A(k,j)*A(k,j);
        H(k,j)=(1-exp(-((B(k,j)).^2/d.^2)));
    end
end
%%%%%%%%%%%%%Using it for my application as homomorphic filtering is
%%%%%%%%%%%%%application specific, taking the value of rL and rH
%%%%%%%%%%%%%values accordingly.
rL=12.6999;
rH=15.51;
H=((rH-rL).*H)+rL;
    
R2 = R1.*H;
Z1 = R2.*exp(i*(Ang));



Himg =exp((ifft2(Z1)));

figure;imshow(uint8(abs(Himg)))

