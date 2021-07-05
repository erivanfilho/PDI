%%Figura 3.35
src = imread('fig0335.tif');
x = 3;
im_b = uint8(conv2(src,ones(x)/x^2,'same'));

im_c = medfilt2(src,[3 3]);

figure;
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(im_b);
subplot(1,3,3);
imshow(im_c);
