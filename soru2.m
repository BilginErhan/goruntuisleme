

% Final 2016-2017 soru2


I = imread('fatik.jpg');
Ig = rgb2gray(I);

[N M] = size(Ig);

D = zeros(N,M);
H = zeros(N,M);

Do = 100;

for u = 1:N
    for v = 1:M
        D(u,v) = sqrt((u-(N/2))^2+(v-(M/2))^2);
        H(u,v) = exp((-D(u,v)^2/2*Do^2));
    end
end

Igyeni = Ig;
Igyeni = double(Igyeni);
Igyeni = Igyeni.*H;
Igyeni = uint8(Igyeni);

figure;
imshow(Ig);
figure;
imshow(Igyeni);