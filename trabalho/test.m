pkg load image;

filtro = im2double(imread("filtro.png"));
filtro = (filtro.*200)<=0;
figure, imshow(filtro);
