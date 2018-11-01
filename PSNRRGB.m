function PSNRCol = PSNRRGB(Original,Filtered)
%This function Calculates the PSNR of RGB image
%Input: Original: Original image
%       Filtered: Image obtained after applying filters
%                 and after interpolating
%Output: PSNR: PSNR value of the Filtered image
[m n]=size(Filtered(:,:,1));
Red=Original(:,:,1);
for k=1:m
    for j=1:n
        ModifiedR(k,j)=Red(k,j);
    end
end
ModifiedR=im2double(ModifiedR);
FilterR=im2double(Filtered(:,:,1));
%FiltcropR=imcrop(FilterR,[1 1 n-1 m-1]);
%ModcropR=imcrop(ModifiedR,[1 1 n-1 m-1]);
[a b]=size(ModifiedR);
eR=imsubtract(FilterR,ModifiedR);
seR=(sum(eR(:).^2));
mseR=seR/(a*b);
[m n]=size(Filtered(:,:,2));
Green=Original(:,:,2);
for k=1:m
    for j=1:n
        ModifiedG(k,j)=Green(k,j);
    end
end
ModifiedG=im2double(ModifiedG);
FilterG=im2double(Filtered(:,:,2));
%FiltcropG=imcrop(FilterG,[1 1 n-1 m-1]);
%ModcropG=imcrop(ModifiedG,[1 1 n-1 m-1]);
[a b]=size(ModifiedG);
eG=imsubtract(FilterG,ModifiedG);
seG=(sum(eG(:).^2));
mseG=seG/(a*b);
[m n]=size(Filtered(:,:,3));
Blue=Original(:,:,3);
for k=1:m
    for j=1:n
        ModifiedB(k,j)=Blue(k,j);
    end
end
ModifiedB=im2double(ModifiedB);
FilterB=im2double(Filtered(:,:,3));
%FiltcropB=imcrop(FilterB,[1 1 n-1 m-1]);
%ModcropB=imcrop(ModifiedB,[1 1 n-1 m-1]);
[a b]=size(ModifiedB);
eB=imsubtract(FilterB,ModifiedB);
seB=(sum(eB(:).^2));
mseB=seB/(a*b);
mse=(mseR+mseG+mseB)/3;
PSNRCol=10*log10(1/mse);

