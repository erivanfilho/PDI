%%Figura 3.24
src = imread('fig0323.tif');
im_b = histeq(src);
hist_b = imhist(src);

h = hist_b/numel(src);
fdc = cumsum(h*255)
x = linspace(0,256,256)

figure;
subplot(2,2,1);
plot(x, fdc);
axis([0 256 0 256]);
set(gca, 'xtick', 0:64:256)
set(gca, 'ytick', 0:64:256)
subplot(2,2,2);
imshow(im_b);
subplot(2,2,3);
imhist(im_b);