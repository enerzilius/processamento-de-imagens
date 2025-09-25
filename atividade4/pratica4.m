pkg load image;

original = imread('pratica4.jpg');
imagemDouble = im2double(original);

figure, imshow(imagemDouble);

m = 9;
average_blur = ones(m, m) / (m*m);

M = filter2(average_blur, imagemDouble);
figure, imshow(M);

# A imagem fica com uma borda preta porque os pixels da máscara com o centro na borda que estão fora da imagem original são preenchidos com 0
# Assim jogando a média da máscara para perto do 0 (preto)

imagemDouble = padarray(im2double(original),  [floor(m/2), floor(m/2)], "replicate");
M = filter2(average_blur, imagemDouble, "valid");
figure, imshow(M);

sobel_x = [
  -1, 0, 1;
  -2, 0, 2;
  -1, 0, 1;
];
sobel_y = [
  -1, -2, -1;
   0,  0,  0;
   1,  2,  1;
];

m = 3;
imagemDouble = padarray(im2double(original),  [floor(m/2), floor(m/2)], "replicate");

gx = filter2(sobel_x, imagemDouble);
gy = filter2(sobel_y, imagemDouble);
M = abs(gx) + abs(gy);

figure, imshow(M);






