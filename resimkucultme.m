I = imread('resim.png'); %resmi oku
Ig = rgb2gray(I);          %gri yap
[N M] = size(Ig);       %satir sutun sayýsý
Iout = zeros(N/2,M/2);  %yarýya küçült

%yeni matrise atama yap ama bir satýr al bir satýr alma
%bir sutun al bir sutun alma seklinde
for i = 1:2:N
    for j =1:2:M
    Iout((i+1)/2,(j+1)/2)=Ig(i,j);
    end
end

%uint8 e dönüþtür 
Iout = uint8(Iout);

%figure de bas
figure;
imshow(Ig);

figure;
imshow(Iout);