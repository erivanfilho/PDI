%%Figura 3.43
src = (imread('fig0343.tif'));

mascara = [[-1, -1, -1], [-1, 8, -1], [-1, -1, -1]];
im_b = conv2(double(src), mascara, 'same');
im_b = im_b - min(min(im_b));
im_b = 255*(im_b/max(max(im_b)));

im_c = imadd(double(src), im_b);

mascara1 = [[-1, -2, -1], [0, 0, 0], [1, 2, 1]];
mascara2 = [[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]];
gx = conv2(src, mascara1, 'same');
gy = conv2(src, mascara2, 'same');
[gx,gy] = imgradientxy(src);
im_d = abs(gx) + abs(gy);

im_e = conv2(im_d, ones(5)/5^2,'same');

im_f = immultiply(im_c, im_e);

im_g = imadd(double(src), im_f);

im_h = (1*(double(im_g)).^0.5);

figure; 
subplot(2,4,1);
imshow(src, []);
subplot(2,4,2);
imshow(im_b, []);
subplot(2,4,5);
imshow(im_c, []);
subplot(2,4,6);
imshow(im_d, []);
subplot(2,4,3);
imshow(im_e, []);
subplot(2,4,4);
imshow(im_f, []);
subplot(2,4,7);
imshow(im_g, []);
subplot(2,4,8);
imshow(im_h, []);