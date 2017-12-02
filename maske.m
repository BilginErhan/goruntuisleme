clc;
clear;
close all;
I = imread('resim.png'); %resmi oku
Ig = rgb2gray(I);   %gri yap

Ig = double(Ig);    %double yap

[N M] = size(Ig);   %satýr sutun sayýsý

Iout = zeros(N+2,M+2);  %maskeleme için satýr ve sutun sayýsýný 2 arttýr matris oluþtur
Iout1 = zeros(N,M);     %maske iþlemi sonucunu tutan matris

m1 = [ 1 1 1; 1 -8 1; 1 1 1];   %maskemiz

k=1;  %orjinal resim üzerindeki deðerlere ulaþan sayaclar
l=1;


for i=1:N+2 %maskenin dolaþacaðý mastris oluþturulur
    for j=1:M+2
        if(i==1 || j==1 || i== N+2 || j ==M+2)  %kenarlar sýfýrlanýr
            Iout(i,j)=0;
        else%orginal resimdeki deðerler yeni matrise aktarýlýr
            Iout(i,j)=Ig(k,l);
            l=l+1;
        end
    end
    l=1;
    if(i~=1 && i~=M+2)
        k=k+1;  %satýr 1 veya son satýrda arttýrýlmaz
    end
end

k=1;
l=1;    %maskemizin dolþatýðý fonksiyonumuz
for i=2:N-1
    for j=2:M-1 %hesaplanan deðer en yeni matrise yollanýr
        Iout1(k,l)=(m1(1,1)*Iout(i-1,j-1)+m1(1,2)*Iout(i-1,j)+m1(1,3)*Iout(i-1,j+1)...
        +m1(2,1)*Iout(i,j-1)+m1(2,2)*Iout(i,j)+m1(2,3)*Iout(i,j+1)+m1(3,1)*Iout(i+1,j-1)+m1(3,2)*Iout(i+1,j)+m1(3,3)*Iout(i+1,j+1))/9;
        l=l+1;
    end
    k=k+1;
    l=1;
end

%en kucuk deðer bulunur
enkucuk = Iout1(1,1);

for i=1:N
    for j=1:M
        if(Iout1(i,j)<enkucuk)
            enkucuk = Iout1(i,j);
        end
    end
end

%matris negatif deðerlerden temizlenir
for i=1:N
    for j=1:M
        if(Iout1(i,j)<0)
            Iout1(i,j)=Iout1(i,j)-enkucuk;
        end
    end
end

%en büyük deðer bulunur
enbuyuk = Iout1(1,1);

for i=1:N
    for j=1:M
        if(Iout1(i,j)>enbuyuk)
            enbuyuk = Iout1(i,j);
        end
    end
end

%matrisdeki 255 den büyük deðerler 255 altýna indirlir
for i=1:N
    for j=1:M
        if(Iout1(i,j)>255)
            Iout1(i,j)=Iout1(i,j)*255/enbuyuk;
        end
    end
end

%matrislerimizin tipi deðiþtirilir
Iout1 = uint8(Iout1);
Ig = uint8(Ig);
figure; %ekrana basýlýr matrisler
imshow(Iout1);
figure;
imshow(Ig);
