%%Figura 3.26
src = imread('fig0326.tif');

im_b = histeq(src);

im_c = blkproc(src,[3 3], @histeq);

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(im_b);
subplot(1,3,3);
imshow(im_c);