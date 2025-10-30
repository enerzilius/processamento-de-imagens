pkg load image;

image = imread("pratica5.png");
image = im2double(image);

[M, N] = size(image);
padded_image = zeros(M*2, N*2);

for i = 1:M
  for j = 1:N
    padded_image(i, j) = image(i, j);
  endfor
endfor

[x, y] = ndgrid(1:M*2, 1:N*2);
centralized_image = padded_image .* ((-1) .^ (x+y));

F = fft2(centralized_image);

figure, imshow(log(1 + abs(F)), []);



