%%Figura 3.34
src = imread('fig0334.tif');
x = 15;
im_b = uint8(conv2(src,ones(x)/x^2,'same'));
max_b = max(max(im_b));
limiar = 0.25 * max_b;
[m,n] = size(im_b);

im_c = zeros(m,n);

for i = 1:m
    for j = 1:n
        if im_b(i,j) < limiar
            im_c(i,j) = 0;
        else 
            im_c(i,j) = 1;
        end
    end
end

figure;
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(im_b);
subplot(1,3,3);
imshow(im_c);