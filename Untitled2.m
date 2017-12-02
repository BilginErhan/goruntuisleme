clc;
clear;
close all;

I = imread('resim.png');
Ig = rgb2gray(I);

kopya = Ig;

[N,M] = size(Ig);

for i = 1:N
    for j = 1:M
        if(Ig(i,j)>=0 && Ig(i,j)<50)
            Ig(i,j) = 30;
        elseif(Ig(i,j)<100)
            Ig(i,j)=70;
        elseif(Ig(i,j)<150)
            Ig(i,j)=255;
        elseif(Ig(i,j)<200)
            Ig(i,j)=170;
        else
            Ig(i,j)=255;
        end
    end
end

figure;
imshow(Ig);
figure
imshow(kopya);