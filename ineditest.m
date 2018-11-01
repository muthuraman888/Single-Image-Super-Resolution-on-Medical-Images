function []=ineditest()
image=imread('D:\final project\images\hand.jpg');
inputimage=imresize(image,[200,200],'bicubic');
processimage=imresize(image,[50,50],'bicubic');
%input arguments for inedi is inedi(IM, ZK, MT, ML, BT, BS, SZ, VR);
%IM: Input image
%ZK:the image enlargement on vertical and horizontal direction is 2^ZK
%MT:maximum radius of the local circular window
%ML:minimum radius of the local circular window
%BT:brightness tollerance
%BS:maximum brigthess difference for smooth areas
%SZ:number of image bits per layer
%VR:verbose mode
processedimage=inedi(processimage, 2, 6, 3, 16, 8, 8, true);
figure,imshow(processedimage)
if (length(size(inputimage))==3)
    psnr = PSNRRGB(inputimage,processedimage)
else
    psnr = PSNRImages(inputimage,processedimage)
end
