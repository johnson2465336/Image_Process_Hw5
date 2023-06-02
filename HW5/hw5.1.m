close all
clear

img = imread("building2.jpg");
figure;imshow(img);
img_noise = imnoise(img,'salt & pepper');
figure;imshow(img_noise);

pseudo_filter = strel('square',3); 
img_psmed = (0.5*imclose(img_noise,pseudo_filter)) + (0.5*imopen(img_noise,pseudo_filter));
figure;imshow(img_psmed);

img_median = medfilt2(img_noise,[3,3]);
figure;imshow(img_median);

psmed_psnr = psnr(img,img_psmed);
median_psnr = psnr(img,img_median);