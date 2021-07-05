%%Figura 3.9
src = imread('fig0309.tif');
src = im2double(src);
[m,n] = size(src);
c = 1;

im_b = abs((c*src.^3));
maxm = max(im_b(:));
minm = min(im_b(:));

for i = 1:m
    for j = 1:n
        im_b(i,j)= (255*im_b(i,j))/(maxm-minm);
    end
end

im_b = uint8(im_b);

im_c = abs((c*src.^4));
maxm = max(im_c(:));
minm = min(im_c(:));

for i = 1:m
    for j = 1:n
        im_c(i,j)= (255*im_c(i,j))/(maxm-minm);
    end
end

im_c = uint8(im_c);

im_d = abs((c*src.^5));
maxm = max(im_d(:));
minm = min(im_d(:));

for i = 1:m
    for j = 1:n
        im_d(i,j)= (255*im_d(i,j))/(maxm-minm);
    end
end

im_d = uint8(im_d);

figure;
subplot(2,2,1);
imshow(src);
subplot(2,2,2);
imshow(im_b);
subplot(2,2,3);
imshow(im_c);
subplot(2,2,4);
imshow(im_d);
