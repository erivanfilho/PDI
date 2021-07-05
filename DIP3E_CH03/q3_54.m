%%Figura 3.54
src = imread('fig0354.tif');

axis([0 255 0 4.5*10^4])
im_b = histeq(src, 256);

axis([0 255 0 15000]);
set(gca,'xtick',0:50:255);
im_c = imadjust(src,[0.25 0.75], [0, 1])

figure;
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(im_b);
subplot(1,3,3);
imshow(im_c);