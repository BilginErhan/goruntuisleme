close all;
clc;
clear;
I = imread('resim.png');

Ig = rgb2gray(I);

Ig = double(Ig);

[N M] = size(Ig);

Iout = zeros(N/2,2*M);
Iout = double(Iout);

k=1;
l=1;
for i = 1:N/2
    for j = 1:2:M*2
        Iout(i,j) = (Ig(k,l)+Ig(k+1,l))/2;
        l=l+1;
    end
    l=1;
    k=k+2;
end

for i = 1:N/2
    for j = 2:2:M*2
        if(j+1>M*2)
            Iout(i,j)= Iout(i,j-1);
        else
            Iout(i,j) = (Iout(i,j-1)+Iout(i,j+1))/2;    
        end
        
    end
end

Ig = uint8(Ig);
Iout = uint8(Iout);

figure;
imshow(Iout);

figure;
imshow(Ig);