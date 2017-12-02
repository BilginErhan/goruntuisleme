clc;
clear;
close all;

I = imread('resim.png');
Ig = rgb2gray(I);
Ig = double(Ig);
[N,M] = size(Ig);

histogram = zeros(1,256);
tershistogram = zeros(1,256);

for i =1:N
    for j = 1:M
        histogram(1,Ig(i,j)+1) = histogram(1,Ig(i,j)+1)+1;
    end
end

for i =1:256
    tershistogram(1,i)=histogram(1,257-i);
        %histogram(1,Ig(i,j)+1) = histogram(1,Ig(i,j)+1)+1;
end
plot(histogram);
hold on;
plot(tershistogram);