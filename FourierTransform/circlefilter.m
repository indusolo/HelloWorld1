clear all;
I=imread('tiger.jpg');
I = rgb2gray(I);
I =  imresize(I,[400,600]);
figure;imshow(I)
F=fft2(double(I));
S=fftshift(F);
R1 = abs((S));
A1 = angle(S);


% % % % % R = real(S);
% % % % % Ig = imag(S);
% % % % % P = R.^2+Ig.^2;

P0 = 0;
k=0;
A= zeros(400,600);




%for r = 10:10:190
r = 8;

for i = 200-r:1:200+r
    for j =300-r:1:300+r
        
        if ((i - 200)^2 +(j-300)^2 <= r^2)
            A(i,j) = 1;
            
        end
    end
end
k=k+1;



R2 = R1.*A;
Z2 = ifftshift(R2).*exp(i*A1);


Rimg1 = ifft2(Z2);

%Pr(k) = sum(sum(P1));
%Rr(k) = r;
figure;
imagesc(R2);colormap('gray')
%
% % % % % P0 = P1;
% % % % % 
% % % % % end
% % % % %  Pr = Pr/Pr(19)*100;
% % % % %  Pr1 = Pr(2:19)-Pr(1);
% % % % % Pr2 = [Pr(1) Pr1];
figure;
imshow(uint8(abs(Rimg1)))


 

