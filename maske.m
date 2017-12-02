clc;
clear;
close all;
I = imread('resim.png'); %resmi oku
Ig = rgb2gray(I);   %gri yap

Ig = double(Ig);    %double yap

[N M] = size(Ig);   %sat�r sutun say�s�

Iout = zeros(N+2,M+2);  %maskeleme i�in sat�r ve sutun say�s�n� 2 artt�r matris olu�tur
Iout1 = zeros(N,M);     %maske i�lemi sonucunu tutan matris

m1 = [ 1 1 1; 1 -8 1; 1 1 1];   %maskemiz

k=1;  %orjinal resim �zerindeki de�erlere ula�an sayaclar
l=1;


for i=1:N+2 %maskenin dola�aca�� mastris olu�turulur
    for j=1:M+2
        if(i==1 || j==1 || i== N+2 || j ==M+2)  %kenarlar s�f�rlan�r
            Iout(i,j)=0;
        else%orginal resimdeki de�erler yeni matrise aktar�l�r
            Iout(i,j)=Ig(k,l);
            l=l+1;
        end
    end
    l=1;
    if(i~=1 && i~=M+2)
        k=k+1;  %sat�r 1 veya son sat�rda artt�r�lmaz
    end
end

k=1;
l=1;    %maskemizin dol�at��� fonksiyonumuz
for i=2:N-1
    for j=2:M-1 %hesaplanan de�er en yeni matrise yollan�r
        Iout1(k,l)=(m1(1,1)*Iout(i-1,j-1)+m1(1,2)*Iout(i-1,j)+m1(1,3)*Iout(i-1,j+1)...
        +m1(2,1)*Iout(i,j-1)+m1(2,2)*Iout(i,j)+m1(2,3)*Iout(i,j+1)+m1(3,1)*Iout(i+1,j-1)+m1(3,2)*Iout(i+1,j)+m1(3,3)*Iout(i+1,j+1))/9;
        l=l+1;
    end
    k=k+1;
    l=1;
end

%en kucuk de�er bulunur
enkucuk = Iout1(1,1);

for i=1:N
    for j=1:M
        if(Iout1(i,j)<enkucuk)
            enkucuk = Iout1(i,j);
        end
    end
end

%matris negatif de�erlerden temizlenir
for i=1:N
    for j=1:M
        if(Iout1(i,j)<0)
            Iout1(i,j)=Iout1(i,j)-enkucuk;
        end
    end
end

%en b�y�k de�er bulunur
enbuyuk = Iout1(1,1);

for i=1:N
    for j=1:M
        if(Iout1(i,j)>enbuyuk)
            enbuyuk = Iout1(i,j);
        end
    end
end

%matrisdeki 255 den b�y�k de�erler 255 alt�na indirlir
for i=1:N
    for j=1:M
        if(Iout1(i,j)>255)
            Iout1(i,j)=Iout1(i,j)*255/enbuyuk;
        end
    end
end

%matrislerimizin tipi de�i�tirilir
Iout1 = uint8(Iout1);
Ig = uint8(Ig);
figure; %ekrana bas�l�r matrisler
imshow(Iout1);
figure;
imshow(Ig);
