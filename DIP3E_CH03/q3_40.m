%%Figura 3.40
src = single(imread('fig0340.tif'));

gkernel = fspecial('gaussian',5,3);
im_b = imfilter(src,gkernel);
im_c = src - im_b;
im_d = src + 1 * im_c;
im_e = src + 4.5*im_c;

figure;
subplot(511);
imshow(src,[]);
subplot(512);
imshow(im_b,[]);
subplot(513);
imshow(im_c,[]);
subplot(514);
imshow(im_d,[]);
subplot(515);
imshow(im_e,[]);