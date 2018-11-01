function processed_image=bicubic(image,zoom)
% This function is used for obtaining bicubic of image
% input:    image: image to do bicubic on
%           zoom: 2x or 4x increase in size using bicubic
% output:   processed_image: image obtained after bicubic
if (length(size(image)) == 3)
% if the input image is an RGB image
% interpolate the three components separetely
%
    for i=1:3
        processed_image(:,:,i) = bicubic(image(:,:,i),zoom);
    end    
else
    [m n]=size(image);
    [X Y]=meshgrid(1:n,1:m);
    if zoom==2
        [X1 Y1]=meshgrid(linspace(1,n,2*n), linspace(1,m,2*m));
    elseif zoom==4
        [X1 Y1]=meshgrid(linspace(1,n,4*n), linspace(1,m,4*m));
    end
    l=im2double(image);
    bicubicimage=interp2(X,Y,l,X1,Y1,'cubic');
    processed_image=bicubicimage;
end