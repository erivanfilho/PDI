%%Figura 4.54
src = imread('Fig0441(a)(characters_test_pattern).tif');

[M,N] = size(src);

fft = fft2(src); %aplicando a transformada discreta de fourier 2D
ffts = fftshift(fft); %deslocamento para o centro
magF = abs(ffts); %encontrando o espectro

%definição do filtro passa alta equação 4.8-2
u = 0:(M-1);
v = 0:(N-1);
u = (u - M / 2); 
v = (v - N / 2); 

[V,U] = meshgrid(v,u);
D = sqrt(U.^2 + V.^2); 

%encontrando a parte real após aplicar a transformada inversa em G1
D1 = 30;
H1 = 1 - double(D<=D1); 
G1 = H1.*ffts;
im_a = real(ifft2(double(ifftshift(G1))));

%encontrando a parte real após aplicar a transformada inversa em G2
D2 = 60;
H2 = 1 - double(D<=D2); 
G2 = H2.*ffts;
im_b = real(ifft2(double(ifftshift(G2))));

%encontrando a parte real após aplicar a transformada inversa em G2
D3 = 160;
H3 = 1 - double(D<=D2); 
G3 = H3.*ffts;
im_c = real(ifft2(double(ifftshift(G3))));

figure;
subplot(1,3,1);
imshow(uint8(im_a));
subplot(1,3,2);
imshow(uint8(im_b));
subplot(1,3,3);
imshow(uint8(im_c));