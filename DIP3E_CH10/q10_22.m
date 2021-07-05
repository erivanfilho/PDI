%Figura 10.22
src = imread('Fig1022(a)(building_original).tif');
src = im2double(src);

%aplicando o filtro LoG 
%fase 1 e 2 do algoritmo de Marr-Hildreth com sigma = 4 e n = 25
filtro_log = fspecial('log', [5,5], 4.0); 
im_b = imfilter(src, filtro_log, 'symmetric', 'conv');

%aplicando o algoritmo de Marr-Hildreth
%o cruzamentos por zeros utilizará 0 como valor do limiar
im_c = edge(src,'log',0,4);

%cruzamento por zeros utilizando 4% do maior valor de pixel da imagem b
%como limiar. o maior valor de pixel em uma escala de 0-255, seria 255. 
%o maior valor de pixel na escala double nativa é 0.0026, o que faria que 
%4% fosse um valor igualmente baixo. o resultado foi obtido utilizando o
%valor de 40% do maior valor de pixel (0.0010)
res_d = 0.4 * max(max(im_b)); 
im_d = edge(src, 'log', res_d, 4);

figure;
subplot(2,2,1);
imshow(src, []);
subplot(2,2,2);
imshow(im_b, []);
subplot(2,2,3);
imshow(im_c, []);
subplot(2,2,4);
imshow(im_d, []);
