clc;
clear;
close all;

I = imread('resim.png');    %resmi oku
Ig = rgb2gray(I);%gri yap

[N, M] = size(Ig);   %satir sutun sayýsý

Iout = zeros(N+2,M+2);  %2 þer satýr sutun ekle maske dolaþmasý için
Iout1 = zeros(N,M);

mask = zeros(1,9); %maskeyi oluþtur

k=1;
l=1;
for i=1:N+2 %çerçeve ekle 0 olarak
    for j = 1:M+2
        if(i == 1 || i==N+2 || j==1 || j==M+2)
            Iout(i,j)=0;
        else
            Iout(i,j)=Ig(k,l);
            l=l+1;
        end
    end
    l=1;
    if(i>1 && i<M+2)
        k=k+1;
    end
end

for i=2:N+1
    for j = 2:M+1   %maskeyi gezdir
        mask(1)=Iout(i-1,j-1);
        mask(1,2)=Iout(i-1,j);
        mask(1,3)=Iout(i-1,j+1);
        mask(1,4)=Iout(i,j-1);
        mask(1,5)=Iout(i,j);
        mask(1,6)=Iout(i,j+1);
        mask(1,7)=Iout(i+1,j-1);
        mask(1,8)=Iout(i+1,j);
        mask(1,9)=Iout(i+1,j+1);
        Iout1(i-1,j-1)=median(mask);    %medyaný yeni matrise ata
    end
end

%uint8 e dönüþtür
Iout1=uint8(Iout1);

figure;
imshow(Iout1);

figure;
imshow(Ig);