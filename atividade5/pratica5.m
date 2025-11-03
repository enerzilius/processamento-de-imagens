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

% Compute D(u,v)
for u = 1:P
  for v = 1:Q
    D(u, v) = sqrt(((u-1) - P/2)^2 + ((v-1) - Q/2)^2);
  endfor
endfor

% Compute H(u,v)
for u = 1:P
  for v = 1:Q
    H(u, v) = e^(-(D(u, v)^2) / (2 * (D0^2)));
  endfor
endfor

% Apply filter
G = transformed .* H;

figure, imshow(H);
