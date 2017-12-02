I = imread('resim.png');
Ig = rgb2gray(I);
[N M] =size(Ig);

T = Ig;
sayac=0;

for i=1:N
    sayac=0;
    T(i,1)=0;
    for j =2:M
        if(Ig(i,j)>Ig(i,j-1))
            sayac=sayac+1;
        end
        T(i,j) = sayac;
    end
end

figure;
imshow(T);