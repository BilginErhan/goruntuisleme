clc;
clear;

i1 = imread('resim.png');
ig1 = rgb2gray(i1); %resim 1 oku

i2 = imread('resim1.png'); %resim 2 oku
ig2 = rgb2gray(i2);

ig1 = double(ig1);  %double çevir
ig2 = double(ig2);

Iout = ig1-ig2;     %Resimleri birbirinden çýkar

[N,M] = size(Iout); %satir sutun sayýsýný al

enkucuk = Iout(1,1);    %en buyuk ve en kucuk deðerleri bul
enbuyuk = Iout(1,1);

for i = 1:N
    for j =1:M
        if(enkucuk>Iout(i,j))
            enkucuk = Iout(i,j);
        end
        if(enbuyuk<Iout(i,j));
            enbuyuk = Iout(i,j);
        end
    end
end

for i = 1:N
    for j = 1:M %0 dan küçükleri - den kurtar
        Iout(i,j) = Iout(i,j)-enkucuk;
    end
end

for i = 1:N
    for j = 1:M %255 den büyükleri aþaðý çek
        Iout(i,j) = Iout(i,j)*255/enbuyuk;
    end
end

%uint8 e dönüþtür
Iout = uint8(Iout);

figure;%ekrana bas
imshow(Iout);