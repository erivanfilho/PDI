%%Figura 3.12
src = imread('fig0312.tif');
[m,n] = size(src);
im_1 = src;
im_2 = src;

for i = 1:m
    for j = 1:n
        if(im_1(i,j) > 150 && im_1(i,j) <= 255)
            im_1(i,j) = 220;
        else
            im_1(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
        if(im_2(i,j) > 80 && im_2(i,j) <= 150)
            im_2(i,j) = 0;
        end
    end
end

figure;
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(im_1);
subplot(1,3,3);
imshow(im_2);