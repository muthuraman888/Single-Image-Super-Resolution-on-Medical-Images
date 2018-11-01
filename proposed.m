function []=proposed()
image = imread('D:\final project\images\skull.jpg');
processimage=bicubicResize(image,4);
figure,imshow(processimage),title('Original Image');
bicubicimage=bicubic(processimage,2);
figure,imshow(bicubicimage),title('Bicubic Image');
filter_coef = [1 -5 20 20 -5 1]/32 ;
filterinterpimage = filter_interp(bicubicimage, filter_coef);
figure,imshow(filterinterpimage),title('Filtered Interpolated Image');
if (length(size(image))==3)
    psnr = PSNRRGB(image,filterinterpimage)
else
    psnr = PSNRImages(image,filterinterpimage)
end