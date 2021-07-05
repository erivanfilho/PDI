%%Figura 3.38
src = imread('fig0338.tif');
x = [[0, 1, 0], [1, -4, 1], [0, 1, 0]];
y = [[1, 1, 1], [1, -8, 1], [1, 1, 1]];

im_b = conv2(double(src),x,'same');

im_c = im_b - min(min(im_b)); 
im_c = 255*(im_c/max(max(im_c)));

im_b = uint8(im_b);
im_c = uint8(im_c);

im_d = src + im_b;

im_e = src + uint8(conv2(double(src), y, 'same'));

figure;
subplot(3,2,1);
imshow(src);
subplot(3,2,3);
imshow(im_b);
subplot(3,2,4);
imshow(im_c);
subplot(3,2,5);
imshow(im_d);
subplot(3,2,6);
imshow(im_e);
