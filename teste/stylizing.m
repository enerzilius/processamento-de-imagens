pkg load image;

reze = imread("reze.jpg");
reze_double = im2double(reze);

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

m = 13;

gx = filter2(sobel_x, reze_double);
gy = filter2(sobel_y, reze_double);
M = abs(gx) + abs(gy);
M = (1-reze_double) + M;
M = M > 0.9;
#M = M > 0.9;
#M = 1.0 - M;


M = reze_double - M;

gray_img = M;  % values in [0,1]

tint = [0.7, 0.0, 0.6];  % RGB multipliers

colored = cat(3, gray_img * tint(1), gray_img * tint(2), gray_img * tint(3));

figure, imshow(colored);
imwrite(colored, "org_s_M.jpg");


