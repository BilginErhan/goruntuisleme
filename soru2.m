clear;
close all;
clc;

I = imread('resim.jpg');

Ig = rgb2gray(I);

[N M] = size(Ig);

Iout = zeros(N*2,M*2);

Ig = double(Ig);
Iout = double(Iout);

k=1;
l=1;
for i=1:2:N*2
    for j=1:2:M*2
        Iout(i,j)=Ig(k,l);
        l=l+1;
    end
    k=k+1;
    l=1;
end

k=1;
l=1;
for i=1:2:N*2
    for j=2:2:M*2
        if(j==M*2)
            Iout(i,j)=Iout(i,j-1);
        else
            Iout(i,j)=(Iout(i,j-1)+Iout(i,j+1))/2;
        end
        
    end
    k=k+1;
    l=1;
end

k=1;
l=1;
for i=2:2:N*2
    for j=1:M*2
        if(i==N*2)
            Iout(i,j)=Iout(i-1,j);
        else
            Iout(i,j)=(Iout(i-1,j)+Iout(i+1,j))/2;
        end
        
    end
    k=k+1;
    l=1;
end


Ig = uint8(Ig);
Iout = uint8(Iout);

figure;
imshow(Ig);
figure;
imshow(Iout);
