%%Figura 4.25
src = imread('Fig0425(a)(translated_rectangle).tif');
src2 = imread('Fig0424(a)(rectangle).tif');
src2 = imrotate(src2, -45); %figura 24 rotacionada em 45º

%aplicando a transformada discreta de fourier 2D
fftx = fft2(src); 
ffty = fft2(src2);

%centralização do espectro e aplicação do logaritmo na figura 25
fs1 = fftshift(fftx);
im_b = log(1 + abs(fs1));

%centralização do espectro e aplicação do logaritmo na figura 24
fs2 = fftshift(ffty);
im_c = log(1 + abs(fs2));

figure;
subplot(2,2,1);
imshow(src, [ ]);
subplot(2,2,2);
imshow(im_b, [ ]);
subplot(2,2,3); 
imshow(src2, [ ]);
subplot(2,2,4); 
imshow(im_c, [ ]);