function filtered_image = filter_interp(image, filter_coef)
% Interpolation function
% This function performs the interpolation of the input image, 
% using the specified filter
% 
% Input:    image: input image
%           filter_coef: filter coefficients
%           example:    filter_coef = [1 1]/2 (Bilinear Filter)
%                       filter_coef = [1 -5 20 20 -5 1]/32 (6-tap filter)
% Output:   filtered_image:  interpolated image

if (length(size(image)) == 3)
% if the input image is an RGB image
% just interpolate the three components separetely
    for i=1:3
        filtered_image(:,:,i) = filter_interp(image(:,:,i),filter_coef);
    end
    
else
    [m,n] = size(image);
    image_filter_ = []; filtered_image = [];
    % columns interpolation
    image_filter_col= filter2(filter_coef,image);
    for i=1:n
        image_filter_ = [image_filter_ image(:,i) image_filter_col(:,i)];
    end
    image_filter_(:,end) = [];
    % rows interpolation
    image_filter_rows = filter2(filter_coef,image_filter_')';
    for i=1:m
        filtered_image = [filtered_image; image_filter_(i,:); image_filter_rows(i,:)];
    end
    filtered_image(end,:) = []; 
end