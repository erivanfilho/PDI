%%Figura 3.10
src = imread('fig0310.tif');
im_r = rescale(src,0,255);
im_r = uint8(im_r);

[m,n] = size(src);
im_s = src;

for i = 1:m
    for j = 1:n
        if(im_s(i,j) > 106)
            im_s(i,j) = 255;
        elseif(im_s(i,j) <= 106)
            im_s(i,j) = 0;
        end
    end
end

figure;
subplot(2,2,1);
imshow(src);
subplot(2,2,2);
imshow(im_r);
subplot(2,2,3);
imshow(im_s);