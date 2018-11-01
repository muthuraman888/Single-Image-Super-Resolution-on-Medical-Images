function []=icbitest()
image=imread('D:\final project\images\hand.jpg');
inputimage=imresize(image,[200,200],'bicubic');
processimage=imresize(image,[50,50],'bicubic');
%inputimage=imresize(processimage,[200,200],'bicubic');
% input arguments for icbi is icbi(IM, ZK, SZ, PF, VR);
% IM : Source image.
% ZK : Power of the zoom factor (default = 1)
% SZ : Number of image bits per layer (default = 8).
% PF : Potential to be minimized (default = 1).
% VR : Verbose mode, if true prints some information during calculation
%      (default = false).
processedimage = icbi(processimage, 2, 8, 1, true);
figure,imshow(processedimage)
if (length(size(inputimage))==3)
    psnr = PSNRRGB(inputimage,processedimage)
else
    psnr = PSNRImages(inputimage,processedimage)
end