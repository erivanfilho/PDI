%%Figura 3.33
src = imread('fig0333.tif');

im_b = uint8(conv2(src, ones(3)/3^2,'same'));
im_c = uint8(conv2(src, ones(5)/5^2,'same'));
im_d = uint8(conv2(src, ones(9)/9^2,'same'));
im_e = uint8(conv2(src, ones(15)/15^2,'same'));
im_f = uint8(conv2(src, ones(35)/35^2,'same'));

figure; 
subplot(3,2,1);
imshow(src);
subplot(3,2,2);
imshow(im_b);
subplot(3,2,3);
imshow(im_c);
subplot(3,2,4);
imshow(im_d);
subplot(3,2,5);
imshow(im_e);
subplot(3,2,6);
imshow(im_f);