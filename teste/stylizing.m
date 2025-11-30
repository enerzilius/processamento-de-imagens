pkg load image;

reze = imread("reze.jpg");
reze_double = im2double(reze);
imshow(reze_double);

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

gx = filter2(sobel_x, reze_double);
gy = filter2(sobel_y, reze_double);
M = abs(gx) + abs(gy);
M = M > 0.9;

figure, imshow(M);

gray_img = M;  % values in [0,1]

tint = [0.8, 0.2, 0.7];  % RGB multipliers

colored = cat(3, gray_img * tint(1), gray_img * tint(2), gray_img * tint(3));

imshow(colored);
imwrite(colored, "reze_coloured.jpg");


