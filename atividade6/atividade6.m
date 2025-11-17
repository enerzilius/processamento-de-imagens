pkg load image;

img = imread("pratica7.png");
figure, imshow(img);

img = im2double(img);

[M, N] = size(img);
P = M*2;
Q = N*2;

transformed = fft2(img, P, Q);

transformed = fftshift(transformed);

figure, imshow(uint8(abs(transformed)));

imwrite(uint8(abs(transformed)), "espectro_imagem.png");

filtro = imread("filtro.png");
filtro = im2double(1-filtro);

G = transformed .* filtro;

f = ifftshift(G);
f = ifft2(f);
f = real(f);


result = f(1:M,1:N);
result = im2uint8(result);

figure, imshow(result);

imwrite(result, "resultado.png");
