%%Figura 3.20
im_1 = imread('fig0320(1).tif');
im_2 = imread('fig0320(2).tif');
im_3 = imread('fig0320(3).tif');
im_4 = imread('fig0320(4).tif');

out_1 = histeq(im_1);
out_2 = histeq(im_2);
out_3 = histeq(im_3);
out_4 = histeq(im_4);

figure;
subplot(4,3,1);
imshow(im_1);
subplot(4,3,2);
imshow(out_1);
subplot(4,3,3);
imhist(out_1);

subplot(4,3,4);
imshow(im_2);
subplot(4,3,5);
imshow(out_2);
subplot(4,3,6);
imhist(out_2);

subplot(4,3,7);
imshow(im_3);
subplot(4,3,8);
imshow(out_3);
subplot(4,3,9);
imhist(out_3);

subplot(4,3,10);
imshow(im_4);
subplot(4,3,11);
imshow(out_4);
subplot(4,3,12);
imhist(out_4);