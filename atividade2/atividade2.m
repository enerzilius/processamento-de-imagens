original = imread('pollen.jpg');
imshow(original);

img_dimensions = size(original);
new_image = zeros(img_dimensions(1), img_dimensions(2), 'uint8');

function s = contrast_stretch (M, A, B, r)
  if (r < A(1))
    m = M(1);
    s1 = 0;
    r1 = 0;
  elseif (r >= A(1) && r < B(1))
    m = M(2);
    s1 = A(2);
    r1 = A(1);
  else
    m = M(3);
    s1 = B(2);
    r1 = B(1);
  endif

  s = s1 + m * (r - r1);
endfunction

# esses foram os pontos que eu achei que tiveram o resultado mais satisfatório
A = [95, 25]; # s1, r1
B = [125, 167]; # s2, r2


m = (A(2) - 0) / (A(1) - 0);
m1 = (B(2) - A(2)) / (B(1) - A(1));
m2 = (255 - B(2)) / (255 - B(1));
M = [m, m1, m2];


x = 1:256;
y = zeros(1, 256);
for i = 1:256
  y(i) = contrast_stretch(M, A, B, x(i));
endfor

plot(x, y);
xlabel("Nível de cinza da entrada - r");
ylabel("Nível de cinza da saida - s");
title("Gráfico da reta");
grid on;
axis([0, 255, 0, 255]);

for i = 1:img_dimensions(1)
  for j = 1:img_dimensions(2)
    new_image(i, j) = contrast_stretch(M, A, B, original(i, j));
  endfor
endfor
imwrite(new_image, 'enhanced_pollen.jpg');
figure, imshow(new_image);

