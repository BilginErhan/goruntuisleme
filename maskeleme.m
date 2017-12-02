clear;
clc;
close all;

I = imread('resim.png');
Ig = rgb2gray(I);
Ig = double(Ig);

maske = [0 -1 0;-1 150 -1;0 -1 0];



[N M] = size(Ig);
[x y] = size(maske);

Iout = zeros(N+2,M+2);
Iout = double(Iout);

k=1;
l=1;
for i= 1:N+2
    for j=1:M+2
        if(i==1 || i== N+2 || j==1 || j==M+2)
            Iout(i,j) = 0;
        else
            Iout(i,j)=Ig(k,l);
            l=l+1;
        end
    end
    if(i==1 || i== N+2)
    else
        k=k+1;
    end
    l=1;
end

for i=2:N-1
    for j=2:M-1
        Iout(i,j)=(Iout(i-1,j-1)*maske(1,1)+Iout(i-1,j)*maske(1,2)+Iout(i-1,j+1)*maske(1,3)+Iout(i,j-1)*maske(2,1)+Iout(i,j)*maske(2,2)+Iout(i,j+1)*maske(2,3)+Iout(i+1,j-1)*maske(3,1)+Iout(i+1,j)*maske(3,2)+Iout(i+1,j+1)*maske(3,3))/(x*y);
        
    end
end


Ig = uint8(Ig);
Iout = uint8(Iout);

figure;
imshow(Ig);

figure;
imshow(Iout);

