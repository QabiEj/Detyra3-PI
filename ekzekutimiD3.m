pkg load image;

% Ngarkimi i imazhit
image = imread("imazhi.jpg");

% Konvertimi i imazhit në gri nëse është e nevojshme
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Aplikimi i filtrit Gauss Band-Reject për largimin e zhumës periodike
filtered_image = gauss_band_reject_filter(image, 20, 50);

% Paraqitja e imazhit origjinal dhe të filtruar
subplot(1, 2, 1);
imshow(image);
title("Imazhi origjinal");

subplot(1, 2, 2);
imshow(filtered_image);
title("Imazhi i filtruar");
