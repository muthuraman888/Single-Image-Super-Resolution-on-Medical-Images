function PSNR = PSNRImages(Original,Filtered)
%This function Calculates the PSNR of gray scale image
%Input: Original: Original image
%       Filtered: Image obtained after applying filters
%                 and after interpolating
%Output: PSNR: PSNR value of the Filtered image
[m n]=size(Filtered);
for k=1:m
    for j=1:n
        Modified(k,j)=Original(k,j);
    end
end
Modified=im2double(Modified);
Filtered=im2double(Filtered);
Filtcrop=imcrop(Filtered,[1 1 n-1 m-1]);
Modcrop=imcrop(Modified,[1 1 n-1 m-1]);
[a b]=size(Modcrop);
e=imsubtract(Filtcrop,Modcrop);
se=(sum(e(:).^2));
mse=se/(a*b);
PSNR=10*log10(1/mse);   