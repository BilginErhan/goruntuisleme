close all;
clc;
clear;

x = ['yatay.png' ; '+45.png  ' ;'dikey.png' ;'-45.png  '];
celldata = cellstr(x)

for k = 1:4
    a = celldata(k);
    a = char(a);
    disp(a);
    I = imread(a);
    Ig = rgb2gray(I);

    Igyeni = Ig;
    [N,M] = size(Ig);

    Igyeni = double(Igyeni);
    Ig = double(Ig);

    if(k==1)
         m = [-1 -1 -1; 2 2 2; -1 -1 -1];
    elseif(k==2)
        m = [-1 -1 2; -1 2 -1; 2 -1 -1];
    elseif(k==3)
         m = [-1 2 -1; -1 2 -1; -1 2 -1];
    elseif (k==4) 
        m = [2 -1 -1; -1 2 -1; -1 -1 2];
    end
    disp(m);
    
    for i = 2:N-1
        for j = 2:M-1
            Igyeni(i,j) = (m(1,1)*Ig(i-1,j-1)+m(1,2)*Ig(i-1,j)+m(1,3)*Ig(i-1,j+1)+m(2,1)*Ig(i,j-1)+m(2,2)*Ig(i,j)+m(2,3)*Ig(i,j+1)+m(3,1)*Ig(i+1,j-1)+m(3,2)*Ig(i,j)+m(3,3)*Ig(i,j))/9;
            if(i>193 && i<200)
            end
        end
    end
    enkucuk = Igyeni(1,1);

    for i =1:N
        for j=1:M
            if(Igyeni(i,j)<enkucuk)
                enkucuk = Igyeni(i,j);
            end
        end
    end

    for i =1:N
        for j=1:M
            if(Igyeni(i,j)<0)
                Igyeni(i,j) = Igyeni(i,j)-enkucuk;
            end
        end
    end


    enbuyuk = Igyeni(1,1);
    for i = 1:N
        for j = 1:M
            if(Igyeni(i,j)>enbuyuk)
                enuyuk = Igyeni(i,j);
            end
        end
    end


    for i =1:N
        for j=1:M
            Igyeni(i,j) = Igyeni(i,j)*255/enbuyuk;
        end
    end

    Igyeni = uint8(Igyeni);
    Ig = uint8(Ig);

    figure;
    imshow(Igyeni);
end