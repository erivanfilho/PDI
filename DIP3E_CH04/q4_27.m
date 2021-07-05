%%Figura 4.27
src = imread('Fig0427(a)(woman).tif');
src2 = imread('Fig0424(a)(rectangle).tif');

[M,N] = size(src2);

%aplicando a transformada discreta de fourier 2D
dft1 = fft2(src,M,N);
dft2 = fft2(src2);

%construção da imagem a partir do ângulo
fftb = 1.*exp(i*angle(dft1));
im_c = real(ifft2(fftb));

%espectro da imagem
espectro = log(1+abs(fftshift(dft1)));
im_c = im_c(1:size(src,1), 1:size(src,2));

%imagem com espectro do retângulo
ffte = abs(dft2).*exp(i*angle(dft1));
im_e = ifft2(ffte);
im_e = im_e(1:size(src,1), 1:size(src,2));

%imagem com ângulo do retângulo
fftf = abs(dft1).*exp(i*angle(dft2));
im_f = ifft2(fftf);

figure; 
subplot(2,3,1);
imshow(src);
subplot(2,3,2);
imshow(angle(dft1),[-pi,pi]);
subplot(2,3,3);
imshow(im_c,[]);
subplot(2,3,4);
imshow(espectro, []);
subplot(2,3,5);
imshow(im_e, []);
subplot(2,3,6);
imshow(im_f, []);