%%Figura 4.24
src = imread('Fig0424(a)(rectangle).tif');

fft = fft2(src); %aplicando a transformada discreta de fourier 2D
im_b = abs(fft);

ffts = fftshift(fft); %deslocamento para o centro
im_c = abs(ffts);

%transformação logarítmica
im_d = log(1 + im_c);

figure; 
subplot(2,2,1);
imshow(src, []);
subplot(2,2,2);
imshow(im_b, []);
subplot(2,2,3);
imshow(im_c, []);
subplot(2,2,4);
imshow(im_d, []);