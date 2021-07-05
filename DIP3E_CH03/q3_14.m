%%Figura 3.14
src = imread('fig0314.tif');
[m,n] = size(src);
im_b = src;
im_c = src;
im_d = src;
im_e = src;
im_f = src;
im_g = src;
im_h = src;
im_i = src;

for i = 1:m
    for j = 1:n
        if(bitget(im_b(i,j),1)==1)
            im_b(i,j) = 255;
        elseif(bitget(im_b(i,j),1)==0)
            im_b(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
        if(bitget(im_c(i,j),2)==1)
            im_c(i,j) = 255;
        elseif(bitget(im_c(i,j),2)==0)
            im_c(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
        if(bitget(im_d(i,j),3)==1)
            im_d(i,j) = 255;
        elseif(bitget(im_d(i,j),3)==0)
            im_d(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
         if(bitget(im_e(i,j),4)==1)
            im_e(i,j) = 255;
        elseif(bitget(im_e(i,j),4)==0)
            im_e(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
         if(bitget(im_f(i,j),5)==1)
            im_f(i,j) = 255;
        elseif(bitget(im_f(i,j),5)==0)
            im_f(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
         if(bitget(im_g(i,j),6)==1)
            im_g(i,j) = 255;
        elseif(bitget(im_g(i,j),6)==0)
            im_g(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
        if(bitget(im_h(i,j),7)==1)
            im_h(i,j) = 255;
        elseif(bitget(im_h(i,j),7)==0)
            im_h(i,j) = 0;
        end
    end
end

for i = 1:m
    for j = 1:n
         if(bitget(im_i(i,j),8)==1)
            im_i(i,j) = 255;
        elseif(bitget(im_i(i,j),8)==0)
            im_i(i,j) = 0;
        end
    end
end

figure;
subplot(3,3,1);
imshow(src);
subplot(3,3,2);
imshow(im_b);
subplot(3,3,3);
imshow(im_c);
subplot(3,3,4);
imshow(im_d);
subplot(3,3,5);
imshow(im_e);
subplot(3,3,6);
imshow(im_f);
subplot(3,3,7);
imshow(im_g);
subplot(3,3,8);
imshow(im_h);
subplot(3,3,9);
imshow(im_i);