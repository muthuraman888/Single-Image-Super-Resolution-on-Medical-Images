function resized_image=bicubicResize(image,factor)
% This function is used for obtaining  resized image
% input:    image: image to resize
%           factor: factor to resize the image by
% output:   resized_image: image obtained after resizing
if (length(size(image)) == 3)
% if the input image is an RGB image
% resize the three components separetely
    for i=1:3
        resized_image(:,:,i) = bicubicResize(image(:,:,i),factor);
    end    
else
    [m n]=size(image);
    reim=uint8(zeros(m/factor,n/factor));
    for k=1:m/factor
        for j=1:n/factor
            reim(k,j)=image(factor*k-1,factor*j-1);
        end
    end
    resized_image=reim;
end