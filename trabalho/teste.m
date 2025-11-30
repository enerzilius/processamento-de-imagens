pkg load image;

img = imread("Imagem.jpg");
img = im2double(img);

hsv = rgb2hsv(img);
V = hsv(:,:,3);

gama = 0.7;
V = V.^gama;
V = real(V);

hsv(:,:,3) = V;

H = hsv(1,:,:);

targetGreen = 1/3;   % ≈ 0.3333
alpha = 0.3;         % strength of pull (0 = none, 1 = fully green)

H = H + alpha * (targetGreen - H);

final_rgb = hsv2rgb(hsv);
figure, imshow(final_rgb);



