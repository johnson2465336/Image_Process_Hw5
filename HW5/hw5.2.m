close all
clear

img = imread('building2.jpg');
img = rgb2gray(img);
figure,imshow(img);

img_gaussian=imnoise(img,'gaussian');
figure,imshow(img_guassian);

img_max=ordfilt2(img_guassian,49,ones(7,7));
img_min=ordfilt2(img_guassian,1,ones(7,7));
img_midpoint=0.5*img_max+0.5*img_min;
img_midpoint=uint8(img_midpoint);
figure,imshow(img_midpoint);

img_wiener=wiener2(img_gaussian,[7,7]);
figure,imshow(img_winner);

psnr_midpoint=psnr(img,img_midpoint);
psnr_wiener=psnr(img,img_wiener);