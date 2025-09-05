pkg load image;

original = imread('../../images/tungsten_filament_corrected.tif');
imshow(original);
m = 0.5;
doubled = im2double(original);

limiarized = doubled > m;

imwrite(limiarized, 'limiarized_image.tif');
figure, imshow(limiarized);

