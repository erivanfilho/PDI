%%Figura 4.17
src = imread('Fig0417(a)(barbara).tif');

[M, N] = size(src);

im_b = imresize(src, [0.5 * M 0.5 * N], 'bilinear');
[i, j] = size(im_b);
r2 = i * 2;
c2 = j * 2;
I2 = zeros(r2, c2);
I2(1:2:r2, 1:2:c2) = im_b;

for i = 1:2:r2
    for j = 1:2:c2
        I2(i, j+1) = I2(i, j);
        I2(i+1, j) = I2(i, j);
        I2(i+1, j+1) = I2(i, j);
    end
end

im_b = I2;

n = 3;
im_c = conv2(src, ones(n)/n^2,'same');
im_c = imresize(im_c,[0.5*M 0.5*N], 'bilinear');


[i, j] = size(im_c);
r2 = i*2;
c2 = j*2;
I2 = zeros(r2,c2);
I2(1:2:r2, 1:2:c2) = im_c;
for i = 1:2:r2
    for j = 1:2:c2
        I2(i,j+1) = I2(i,j);
        I2(i+1,j) = I2(i,j);
        I2(i+1,j+1) = I2(i,j);
    end
end

im_c = I2;

figure; 
subplot(1,3,1);
imshow(src, []);
subplot(1,3,2);
imshow(im_b, []);
subplot(1,3,3);
imshow(im_c, []);