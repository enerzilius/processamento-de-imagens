pkg load image;

image = imread("pratica5.png");
image = im2double(image);

[M, N] = size(image);
P = M*2;
Q = N*2;

transformed = fft2(image, P, Q);

transformed = fftshift(transformed);

figure, imshow(uint8(abs(transformed)));

D0 = 20;
D = zeros(P, Q);
H = zeros(P, Q);

u = 0:(P-1);
v = 0:(Q-1);
[U, V] = meshgrid(u, v);

D = sqrt((U-P/2).^2 + (V-Q/2).^2);
H = exp(-(D.^2) / (2 * (D0^2)));

figure, imshow(H);

G = transformed .* H;

f = ifftshift(G);
f = ifft2(f);
f = real(f);


result = f(1:M,1:N);
result = im2uint8(result);

figure, imshow(result);

