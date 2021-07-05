%%Figura 3.27
src = imread('fig0327.tif');

im_b = histeq(src);

e = 4.0;
k0 = 0.4;
k1 = 0.02;
k2 = 0.4;

media_g = mean2(src);
desvio_g = std2(src);
media_xy = conv2(src, ones(3)/9, 'same');
desvio_xy = stdfilt(src);

[m,n] = size(src);
im_c = zeros(m,n);

for i = 1:m
    for j = 1:n
        if media_xy(i,j) <= k0*media_g && k1*desvio_g <= desvio_xy(i,j) <= k2*desvio_g
            im_c(i,j) = e*src(i,j);
        else
            im_c(i,j) = src(i,j);
        end
    end
end

im_c = uint8(im_c);

figure; 
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(im_b);
subplot(1,3,3);
imshow(im_c);