original = imread('../../images/tungsten_filament_corrected.tif');
imshow(original);
doubled = im2double(original);
negativo = 1.0 - doubled;
figure, imshow(negativo);
