%%Figura 4.55
src = imread('Fig0441(a)(characters_test_pattern).tif');

PS = paddedsize(size(src)); %determina o melhor preenchenchimento para fourier

%cria filtro passa alta de ordem 2 e D0 = 30
H1 = hpfilter('btw', PS(1), PS(2), 30,1); 
%transformada de fourier de acordo com o filtro
F1 = fft2(double(src),size(H1,1),size(H1,2)); 
G1 = H1.*F1; 
im_a = real(ifft2(double(ifftshift(G1))));
%ajuste no tamanho da imagem devido ao preenchimento usado
im_a = im_a(1:size(src,1), 1:size(src,2)); 

%cria filtro passa alta de ordem 2 e D0 = 60
H2 = hpfilter('btw', PS(1), PS(2), 60,1); 
%transformada de fourier de acordo com o filtro
F2 = fft2(double(src),size(H2,1),size(H2,2)); 
G2 = H2.*F2; 
im_b = real(ifft2(double(ifftshift(G2))));
%ajuste no tamanho da imagem devido ao preenchimento usado
im_b = im_b(1:size(src,1), 1:size(src,2)); 

%cria filtro passa alta de ordem 2 e D0 = 160
H3 = hpfilter('btw', PS(1), PS(2), 160,1);
%transformada de fourier de acordo com o filtro
F3 = fft2(double(src),size(H3,1),size(H3,2));
G3 = H3.*F3; 
im_c = real(ifft2(double(ifftshift(G3))));
%ajuste no tamanho da imagem devido ao preenchimento usado
im_c = im_c(1:size(src,1), 1:size(src,2));

figure;
subplot(1,3,1);
imshow(uint8(im_a));
subplot(1,3,2);
imshow(uint8(im_b));
subplot(1,3,3);
imshow(uint8(im_c));