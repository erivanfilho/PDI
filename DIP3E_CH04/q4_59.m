%%Figura 4.59
src = imread('Fig0459(a)(orig_chest_xray).tif');

% Filtragem passa-alta com filtro gaussiano
src_d = double(src);
fft = fftshift(fft2(src_d));

[M,N] = size(fft);
m = fix(M / 2);
n = fix(N / 2);
D0 = 40;

for i = 1:M
    for j = 1:N
        dist = sqrt((i - m)^2 + (j - n)^2);
        H = exp(-(dist.^2)./(2*(D0^2)));   
        res(i,j) = (1 - H) * fft(i,j);
    end
end

res = ifftshift(res);
im_b = ifft2(res);
im_b = uint8(real(im_b));

%Filtragem de ênfase de alta frequência
filtro = 0.5 + 0.75 * (1 - H);
enf = filtro * fft;
res2 = ifftshift(enf);
im_c = ifft2(res2);
im_c = uint8(real(im_c));

%Equalização de histograma da filtragem de ênfase de alta frequência
im_d = histeq(im_c, 256);
im_d = uint8(im_d);

figure;
subplot(2,2,1);
imshow(src);
subplot(2,2,2);
imshow(im_b, []);
subplot(2,2,3);
imshow(im_c, []);
subplot(2,2,4);
imshow(im_d, []);
