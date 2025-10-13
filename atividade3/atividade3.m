pkg load image;

function [new_image, s] = equalize_histogram(image)
  L = 256;
  dimensions = size(image);
  MN = dimensions(1) * dimensions(2);

  [counts, x] = imhist(image);
  pr = (L-1)*counts / MN;
  sum = cumsum(pr);
  s = round(sum);

  new_image = s(double(image) + 1);
  new_image = uint8(new_image);
endfunction

original = imread('imagem.jpg');

[new_image, s] = equalize_histogram(original);

figure, plot(0:255, s);
xlabel('Nível de cinza original (l)');
ylabel('Nível de cinza transformado (s)');
title('Função de transformação de intensidade s(l)');
axis([0 255 0 255]);
grid on;

new_image = equalize_histogram(original);

figure, plot(imhist(new_image));
axis([0 255 0 40000])
xlabel('Nível de cinza(l)');
ylabel('Número de pixels(n)');
title('Histograma da imagem equalizada');
grid on;

imwrite(new_image, 'imagem_equalizada.jpg');
figure, imshow(new_image);






