pkg load image;

A = imread('tungsten_filament_shaded.tif');
imshow(A);
B = imread('tungsten_sensor_shading.tif');

doubleA = im2double(A);
doubleB = im2double(B);

final = doubleA ./ doubleB;
imwrite(final, 'tungsten_filament_corrected.tif');
figure, imshow(final);

