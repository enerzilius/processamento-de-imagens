pkg load image;

img = imread("Imagem.jpg");
img = im2double(img);
figure, imshow(img);

hsv = rgb2hsv(img);
V = hsv(:,:,3);

[M, N] = size(V);
P = M*2;
Q = N*2;

transformed = fft2(img, P, Q);

transformed = fftshift(transformed);

imwrite(uint8(abs(transformed)), "espectro.png");


filtro = imread("filtro.png");
filtro = (filtro.*200)<=0;

G = transformed .* filtro;

f = ifftshift(G);
f = ifft2(f);
f = real(f);


V = f(1:M,1:N);
figure, imshow(V);

gama = 0.7;
V = V.^gama;
V = real(V);

hsv(:,:,3) = V;
final_rgb = hsv2rgb(hsv);
figure, imshow(final_rgb);
imwrite(final_rgb, "final_result.png");



