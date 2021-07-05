%%Figura 4.31
src = double(imread('Fig0431(d)(blown_ic_crop).tif'));

[M, N] = size(src);

h1 = lpfilter('gaussian', M, N, 8);
h2 = hpfilter('gaussian', M, N, 8);
h3 = (hpfilter('gaussian', M, N, 8) + 0.85);

fft = fft2(src); %aplicando a transformada discreta de fourier 2D

g1 = h1.*fft;
g2 = h2.*fft;
g3 = h3.*fft;

im_d = real(ifft2(g1));
im_e = real(ifft2(g2));
im_f = real(ifft2(g3));

figure; 
subplot(1,3,1);
imshow(im_d, [])
subplot(1,3,2);
imshow(im_e, []);
subplot(1,3,3);
imshow(im_f, []);