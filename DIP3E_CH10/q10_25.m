%Figura 10.25
src = imread('Fig1025(a)(building_original).tif');
src = im2double(src);

%gradiente limiarizado
%aplicando filtro de média sobre a imagem fonte
filtrofs = fspecial('average', [5,5]);   
avg = imfilter(src, filtrofs, 'symmetric', 'conv'); 
%utilizando 33% do maior valor de um pixel para o limiar
porcent1 = 0.33 * max(max(avg));
%aplicando limiar threshold
gradlim = (avg < porcent1); 
[gmag, gdir] = imgradient(avg);

%algoritmo de Marr-Hildreth
%aplicando apenas o filtro LoG (Laplacian of Gaussian) para 
%encontrar o valor do limiar (40% do maior valor de pixel)
filtrolog = fspecial('log', [5,5], 4.0); 
imlog = imfilter(src, filtrolog, 'symmetric', 'conv');
porcent2 = 0.4 * max(max(imlog));
%aplicando Marr-Hildreth (LoG) com sigma = 4 e o limiar porcent2
im_c = edge(src, 'log', porcent2, 4);

%algoritmo de Canny
%limiar inferior = 0.04, limiar superior = 0.10 e sigma = 4 
im_d = edge(im2uint8(src), 'canny', [0.04,0.10],4);

figure;
subplot(2,2,1);
imshow(src,[]);
subplot(2,2,2);
imshow(gmag > 0.33);
subplot(2,2,3);
imshow(im_c,[]);
subplot(2,2,4);
imshow(im_d,[]);