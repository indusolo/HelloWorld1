A= zeros(400,600);

r = 30;

for i = 200-r:1:200+r
    for j =300-r:1:300+r
        
        if ((i - 200)^2 +(j-300)^2 <= r^2)
            A(i,j) = 1;
            
        end
    end
end
imshow(A)
            