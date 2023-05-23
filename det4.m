pkg load image;
% Ngarkimi i Figurës 2 (regjionit binar origjinal)
image = imread(lena.tif');
image = rgb2gray(image);

% Krijimi i elementit strukturor (vijës vertikale)
vertical_line = ones(5, 1);

% Zbatimi i operacionit të dilatimit
dilated_image = imdilate(image, vertical_line);

% Shfaqja e rezultatit (Figura 3)
imshow(dilated_image);
title('Figura 3');
