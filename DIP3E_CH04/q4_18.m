%%Figura 4.18
src = imread('Fig0418(a)(ray_traced_bottle_original).tif');

%redução pelo método de interpolação bilinear (imresize)
im_b = imresize(src,[256,256],'Method','bilinear');

%filtro de média 5x5
c = medfilt2(src,[5 5]);

%redução da imagem filtrada para 25% do seu tamanho original
im_c = imresize(c,[256,256],'Method','bilinear');

figure;
subplot(1,3,1);
imshow(src);
subplot(1,3,2);
imshow(im_b);
subplot(1,3,3);
imshow(im_c);