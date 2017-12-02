clc;
clear;
close all;

I = imread('resim.jpg');
Ig = rgb2gray(I);
Ig = double(Ig);

[N M] = size(Ig);

Iout = zeros(N+2,M+2);
%Iout1 = zeros()
filtre = zeros(3,3);

k=1;
l=1;
for i=1:N+2
    for j=1:M+2
        if(i == 1 || j==1 || i==N+2 || j==M+2)
            Iout(i,j)=0;
        else
            if (i < 3 || i>512)
            end
            %Iout(i,j)=Ig(k,l);
            l=l+1;
        end
    end
    k=k+1;
    l=1;
end

k=1;
l=1;
% for i=1:3:N+2
%     for j=1:M+2
%         filtre(1,1)=Iout(i,j);
%         filtre(1,2)=Iout(i,j+1);
%         filtre(1,3)=Iout(i,j+2);
%         filtre(2,1)=Iout(i+1,j);
%         filtre(2,2)=Iout(i+1,j+1);
%         filtre(2,3)=Iout(i+1,j+2);
%         filtre(3,1)=Iout(i+2,j);
%         filtre(3,2)=Iout(i+2,j+1);
%         filtre(3,3)=Iout(i+2,j+2);
%         med = median(filtre);
%     end
% end
