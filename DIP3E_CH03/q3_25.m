%%Figura 3.25
src = imread('fig0323.tif');

t = ones(1, 256);
t(1:127) = linspace(0, 10, 127);
t(127:200) = linspace(10, 120, 74);
t(200:256) = linspace(120, 256, 57);
t = rescale(t,0,255);

localbins = linspace(0,255,256);
cont = zeros(256,1);

cont(1:15) = linspace(0,7*10^4,15);
cont(15:28) = linspace(7*10^4, 1.31*10^4,14);
cont(28:190) = linspace(1.31*10^4, 0, 163);
cont(190:194) = linspace(0, 1.31*10^4, 5);
cont(194:256) = linspace(1.31*10^4, 0, 63);

im_b = histeq(src);

[m,n] = size(src);
src = uint8(src) + 1;

for i = 1:m
    for j = 1:n
        im_b(i,j) = t(im_b(i,j));
    end
end

figure;
subplot(3,2,1);
stem(localbins, cont, 'Marker', 'none');
subplot(3,2,2);
imshow(im_b);
subplot(3,2,3);
plot(0:255,t);
subplot(3,2,5);
imhist(im_b);
