close all;
clc;
clear;
I=imread('resim.png'); %resmi oku
Ig = rgb2gray(I);       %griye �evir
Ig = double(Ig);
[N M] = size(Ig);   %sat�r n sutun m

Iout = zeros(N/2,M/2); %yar�ya d���r�lm�� bir matris olu�tur

k=1;
l=1;
for i = 1:2:N
    for j = 1:2:M
        Iout(k,l)=(Ig(i,j)+Ig(i,j+1)+Ig(i+1,j)+Ig(i+1,j+1))/4;
        l=l+1;
    end
    k=k+1;
    l=1;
end

Ig = uint8(Ig);
Iout = uint8(Iout);

figure;
imshow(Iout);
figure;
imshow(Ig);
