image_matrix = [ones(100,100) zeros(100,100) ones(100,100)];
image_matrix = [ones(100,300);image_matrix;ones(100,300)];
 
% imwrite (randi([0 1], 400,400), "image.bmp");
% imwrite (image_matrix, "image.bmp");

image=zeros(300,400,3); %initialize
 image(:,1:100,1)=0.5;   %Red (dark red)
 image(:,101:200,1)=1;   %Red (maximum value)
 image(1:100,:,2)=rand(100,400);  %Green
 % imshow(image)
 
% imshow(image_matrix);
I = imread('sample_pic.jpg');
imshow(I);