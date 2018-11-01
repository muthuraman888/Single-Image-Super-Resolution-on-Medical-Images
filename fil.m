function filtered_image = fil(im, filter_coef)
% This function applies the specified filter
% Input:    im: input image
%           filter_coef: filter coefficients
%           example:    filter_coef = [1 1]/2 (Bilinear Filter)
%                       filter_coef = [1 -5 20 20 -5 1]/32 (6-tap filter)
% Output:   filtered_image:Output after applying the filter to the image

if (length(size(im)) == 3)
% if the input image is an RGB image
% just apply the filter to three components separetely
    for i=1:3
        filtered_image(:,:,i) = fil(im(:,:,i),filter_coef);
    end
else
    filtered_image= filter2(filter_coef,im);
end