%%Figura 4.36
src = imread('Fig0431(d)(blown_ic_crop).tif');
[M, N] = size(src);

%dimensões indicadas na literatura
p = 2 * M;
q = 2 * N;

%IMAGEM 2
%imagem preenchida de zeros 
im_pre = padarray(src, [M N], 'pos');

%IMAGEM 3
%imagem com transformada centrada multiplicando por (-1)^(x+y)
[x,y]=size(im_pre);
im_central=zeros(p,q);
for i=1:p
    for j=1:q
        im_central(i,j)=im_pre(i,j)*((-1)^(i+j));
    end
end

%IMAGEM 4
a = fft2(im_central); %aplicando a transformada discreta de fourier 2D
im_esp = fftshift(a); %termo de frequência zero no centro
im_esp = abs(im_esp); %espectro da imagem centralizada
im_esp = log(1 + im_esp);%aumentando o brilho na saída

%IMAGEM 5
%filtro passa baixa centralizado
%definindo e centralizando as coordenadas do filtro
u = 0:(p-1);
v = 0:(q-1);
u = u - p/2; 
v = v - q/2;
[v,u] = meshgrid(v,u);
D0 = 0.05 * q; %frequência de corte
F = fft2(im_esp, p, q);
H = exp(-(u.^2 + v.^2) / (2*(D0^2)));
G = real(ifft2(H.*F));

%IMAGEM 6
%espectro de H*Fp
Ga = fft2(G);
%termo de frequência zero no centro
G_esp = fftshift(Ga);
G_esp = abs(G_esp);
G_esp = log(1+G_esp);

%IMAGEM 7
%multiplicando H*Fp por (-1)^(x+y)
F = fft2(im_pre, p, q);
G_7 = real(ifft2((H.*F)));
[x,y] = size(G_7);
G_prod = zeros(x,y);
for i=1:x
    for j=1:y
        G_prod(i,j)=G_7(i,j)*((-1)^(i+j));
    end
end

%IMAGEM 8
%após remoção do preenchimento
for i=1:M
    for j=1:N
        im_final(i,j)=G_prod(i,j);
    end
end

figure;
subplot(3,3,1);
imshow(uint8(src));
subplot(3,3,2);
imshow(uint8(im_pre));
subplot(3,3,3);
imshow(uint8(im_central));
subplot(3,3,4);
imshow(im_esp,[]);
subplot(3,3,5);
imshow(H);
subplot(3,3,6);
imshow(fftshift(G_esp),[ ]);
subplot(3,3,7);
imshow(G_prod);
subplot(3,3,8);
imshow(im_final);