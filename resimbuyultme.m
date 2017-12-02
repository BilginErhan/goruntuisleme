clc;
clear;
close all;
I = imread('resim.png'); % resmi oku
Ig = rgb2gray(I);   %gri yap

[N M] = size(Ig);   %sat�r sutun say�s�
Iout = zeros(N*2,M*2); % 2 kat b�y�k yeni matris olu�tur

for i = 1:2:N*2 %yeni matrise k���k matrisi da��t
    for j=1:2:M*2
        Iout(i,j)=Ig((i+1)/2,(j+1)/2);%bir sat�r dolu bir sat�r bo� ve sutun da ayn� �ekilde
        Iout(i+1,j)=Iout(i,j);%daha sonra bo� kalan sat�rlar� �stteki sat�r� kopyala
    end
end

for i = 1:N*2   %bo� kalan sutun de�erlerini doldurmak i�in sol ve sa�daki de�erlerin ortalamas�n� al
    for j =2:2:M*2
        if (j==M*2) %sutun sondaysa soldakini kopyala
            Iout(i,j)=Iout(i,j-1);
        else
            Iout(i,j)=(Iout(i,j-1)+Iout(i,j+1))/2;
        end
    end
end


Iout = uint8(Iout); %Iout u uint8 e d�n��t�r

figure;
imshow(Iout);

figure;
imshow(Ig);