%%Figura 4.45
src = imread('Fig0445(a)(characters_test_pattern).tif');

[M, N] = size(src);

H1 = lpfilter('btw', M, N, 10, 2);
H2 = lpfilter('btw', M, N, 30, 2);
H3 = lpfilter('btw', M, N, 60, 2);
H4 = lpfilter('btw', M, N, 160, 2);
H5 = lpfilter('btw', M, N, 460, 2);

fft = fft2(double(src), size(H1,1), size(H1,2));

G1 = H1.*fft;
G2 = H2.*fft;
G3 = H3.*fft;
G4 = H4.*fft;
G5 = H5.*fft;

im_b = mat2gray(real(ifft2(G1)));
im_b = im_b(1:size(src,1),1:size(src,2));

im_c = mat2gray(real(ifft2(G2)));
im_c = im_c(1:size(src,1),1:size(src,2));

im_d = mat2gray(real(ifft2(G3)));
im_d = im_d(1:size(src,1),1:size(src,2));

im_e = mat2gray(real(ifft2(G4)));
im_e = im_e(1:size(src,1),1:size(src,2));

im_f = mat2gray(real(ifft2(G5)));
im_f = im_f(1:size(src,1),1:size(src,2));

figure; 
subplot(3,2,1);
imshow(src)
subplot(3,2,2);
imshow(im_b)
subplot(3,2,3);
imshow(im_c)
subplot(3,2,4);
imshow(im_d)
subplot(3,2,5);
imshow(im_e)
subplot(3,2,6);
imshow(im_f)