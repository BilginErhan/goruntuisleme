
%Final 2016-2017 1. soru

%I = imread('fatik.jpg');
%Ig = rgb2gray(I);

function soru1(Ig)

[N M] = size(Ig);

T = zeros(N,M);

for i = 1:N
    for j = 1:M
        if(Ig(i,j)<=99)
            T(i,j)=0;
        elseif(Ig(i,j)<=199)
            T(i,j)=10;
        elseif(Ig(i,j)<=255)
            T(i,j)=20;
        end
    end
end

figure;
imshow(T);
figure;
imshow(Ig);
end