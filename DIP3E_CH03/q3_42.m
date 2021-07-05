%%Figura 3.42
src = imread('fig0342.tif');
[gx,gy] = imgradientxy(src);
im_b = abs(gx) + abs(gy);

figure;
subplot(1,2,1);
imshow(src, []);
subplot(1,2,2);
imshow(im_b, []);