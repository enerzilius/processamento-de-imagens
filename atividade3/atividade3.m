pkg load image;

function new_image = equalize_histogram(image)
  L = 256;
  dimensions = size(image);
  MN = dimensions(1) * dimensions(2);

  [counts, x] = imhist(image);
  nk = (L-1)*counts / MN;
  sum = cumsum(nk);
  s = round(sum);

  new_image = s(double(image) + 1);
  new_image = uint8(new_image);
endfunction

original = imread('imagem.jpg');

new_image = equalize_histogram(original);

[counts, bins] = imhist(new_image);

bar(bins, counts, 'FaceColor', 'c', 'EdgeColor', 'none');
xlabel('Gray level (L)');
ylabel('Pixel count (n)');
title('Histogram of Equalized Image');
xlim([0 255]);                        % full gray range
grid on;


figure, imshow(new_image);






