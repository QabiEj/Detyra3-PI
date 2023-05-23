function filtered_image = gauss_band_reject_filter(image, filter_size, radius)
    % Calculate the center of the image
    center = floor(size(image) / 2) + 1;

    % Calculate the distances of pixels from the center of the image
    [x, y] = ndgrid(1:size(image, 1), 1:size(image, 2));
    distances = sqrt((x - center(1)).^2 + (y - center(2)).^2);

    % Create the filter mask
    mask = ones(size(image));
    mask(distances >= center(1) - filter_size/2 & distances <= center(1) + filter_size/2 & distances <= radius) = 0;

    % Apply the Gaussian filter using imfilter
    sigma = filter_size/2;
    filtered_image = imfilter(image, fspecial('gaussian', filter_size, sigma), 'replicate') .* mask;
end

