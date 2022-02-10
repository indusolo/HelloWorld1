I = ones(10,10)*30;
IF = fft2(I);

I=imread('garden.jpg');
I = rgb2gray(I);

figure; image(I);colormap(gray);axis off
F = zeros(10,10);
%for i =1:10
 %   for  j = 1:10
 k =1; 
 l = 1;
      
 a = 7; b =5
        F =exp((-i*2*pi/10)*(k*a+l*b));%     I(a,b)*exp(-i*2*pi/10*(k*a+l*b));
  
     
        image((abs(F)));colormap('gray')
       

A = exp(i*2*pi/10)
imagesc((angle(A)));colormap('gray')
