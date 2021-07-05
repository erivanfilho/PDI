%%Figura 4.57
src = imread('Fig0457(a)(thumb_print).tif');

[M,N] = size(src);
src2 = double(src);

%aplicando a transformada de fourier 2D e o deslocamento para o centro
fft = fftshift(fft2(src2));

%pegando as distâncias para o centro da imagem
x = (ones(M,1) * [1:N] - (fix(N / 2) + 1)) / N;
y = ([1:M]' * ones(1,N) - (fix(M / 2) + 1)) / M;
radius = sqrt(x.^2 + y.^2); 

%criando filtro passa alta segundo a equação 4.8-2
filtro = 1 ./ (1.0 + (radius ./ 0.5).^(2*4));
filtro = 1 - filtro;

%aplicando o filtro na imagem
res = fft .* filtro;
im_b = real(ifft2(ifftshift(res)));

%limiarizando a imagem
im_c = im2bw(log( 1 + abs(im_b) ), 0.8);

figure;
subplot(1,3,1); 
imshow(src);
subplot(1,3,2); 
imshow(log(1 + abs(im_b)), []);
subplot(1,3,3); 
imshow( im_c, []);