clc;
clear;
close all;
I = imread('resim.png'); % resmi oku
Ig = rgb2gray(I);   %gri yap

[N M] = size(Ig);   %satýr sutun sayýsý
Iout = zeros(N*2,M*2); % 2 kat büyük yeni matris oluþtur

for i = 1:2:N*2 %yeni matrise küçük matrisi daðýt
    for j=1:2:M*2
        Iout(i,j)=Ig((i+1)/2,(j+1)/2);%bir satýr dolu bir satýr boþ ve sutun da ayný þekilde
        Iout(i+1,j)=Iout(i,j);%daha sonra boþ kalan satýrlarý üstteki satýrý kopyala
    end
end

for i = 1:N*2   %boþ kalan sutun deðerlerini doldurmak için sol ve saðdaki deðerlerin ortalamasýný al
    for j =2:2:M*2
        if (j==M*2) %sutun sondaysa soldakini kopyala
            Iout(i,j)=Iout(i,j-1);
        else
            Iout(i,j)=(Iout(i,j-1)+Iout(i,j+1))/2;
        end
    end
end


Iout = uint8(Iout); %Iout u uint8 e dönüþtür

figure;
imshow(Iout);

figure;
imshow(Ig);