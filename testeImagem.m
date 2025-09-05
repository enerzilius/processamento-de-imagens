I = imread('images/example_exponential_fog.png');
#imshow(I);
# B = imread('images/example_layered_fog.png');
S = conv2 (I, ones (5, 5) / 25, "same");
#figure, imshow(B);
[Dx, Dy] = gradient (S);
#figure, imshow(B);
