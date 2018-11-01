y=[25.0712,23.4335,24.6593,25.0548,26.8935,26.1670,27.0084 ];
%PSNR values of 4X enlargement using proposed method for all seven images
y1=[24.7085, 23.3393,24.4780,24.8457,26.6362,25.9985,26.9173];
%PSNR values of 4X enlargement using iNEDI for all seven images
y2=[28.4225,25.5284,28.1812,28.4284,28.7861,27.6841,29.5574];
%PSNR values of 4X enlargement using ICBI for all seven images
x=[1,2,3,4,5,6,7];
plot(x,y,'g--o',x,y1,'r--o',x,y2,'b--*')
xlabel('Number of Image');
ylabel('PSNR in Decibels(dB)');