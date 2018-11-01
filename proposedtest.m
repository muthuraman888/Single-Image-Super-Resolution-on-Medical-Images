function []=proposedtest()
image=imread('D:\final project\images\hand.jpg');
zoom=4;
processimage=imresize(image,[50,50],'bicubic');
figure,imshow(processimage)
filter_coef = [1 -5 20 20 -5 1]/32 ;
if zoom==4
    inputimage=imresize(image,[200,200],'bicubic');
    bicubicimage=bicubic(processimage,2);
elseif zoom==8
    inputimage=imresize(image,[400,400],'bicubic');
    bicubicimage=bicubic(processimage,4);
end
filteredimage = filter_interp(bicubicimage, filter_coef);
figure,imshow(filteredimage)
if (length(size(image))==3)
    psnr = PSNRRGB(inputimage,filteredimage)
else
    psnr = PSNRImages(inputimage,filteredimage)
end