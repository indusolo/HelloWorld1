clear all;
I=imread('nat2.jpeg');
I = rgb2gray(I);
I =  imresize(I,[400,600]);
figure;imshow(I)
F=fft2(double(I));
S=fftshift(F);
%L=log2(S);

R = real(S);
Ig = imag(S);
P = R.^2+Ig.^2;

P0 = 0;
k=0;
A= zeros(400,600);


psd = 10*log10(abs(fftshift(fft2(I))).^2 );
figure; clf
mesh(psd)


for r = 10:10:190
%r = 78;

for i = 200-r:1:200+r
    for j =300-r:1:300+r
        
        if ((i - 200)^2 +(j-300)^2 <= r^2)
            A(i,j) = 1;
            
        end
    end
end
k=k+1;



P1 = P.*A;
Pr(k) = sum(sum(P1));
Rr(k) = r;
%figure;
%imagesc(P1);colormap('gray')

P0 = P1;

end
 Pr = Pr/Pr(19)*100;
 Pr1 = [0 Pr];
Pr2 = diff(Pr1);%[Pr(1) Pr1];
figure;

plot(Rr,Pr,'*r-','LineWidth',2)
axis([0,200,0,100])

figure;
 
plot(Pr2,'ob-','LineWidth',2)
axis([0,10,0,100])

