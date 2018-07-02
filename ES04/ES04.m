%se17m019 Leonhardt Schwarz

A = imread('Nut.jpg');
A = rgb2gray(A);

%Noise and Filters
figure

%Salt Pepper
salt_pepper_noise = imnoise(A, 'salt & pepper', 0.2);
subplot(3,3,1);
imshow(salt_pepper_noise);
title('Salt & pepper')

%median
median_filter =@(x) median(x(:));
median_filter_salt_pepper = nlfilter(salt_pepper_noise, [5 5], median_filter);
subplot(3,3,2);
imshow(median_filter_salt_pepper);
title('Median Salt & pepper')

%averaging
subplot(3,3,3);
average_salt_pepper = conv2(salt_pepper_noise, fspecial('average', 5));
imshow(uint8(average_salt_pepper));
title('Average Salt & pepper')

%gaussian
subplot(3,3,4);
gaussian_salt_pepper = conv2(salt_pepper_noise, fspecial('gaussian', 5));
imshow(uint8(gaussian_salt_pepper));
title('gaussian Salt & pepper')

% Gaussian Noise
subplot(3,3,5);
gaussian_noise_1 = imnoise(A, 'gaussian', 0, 0.01);
imshow(uint8(gaussian_noise_1));
title('Gaussian 0.01');

subplot(3,3,6);
gaussian_noise_2 = imnoise(A, 'gaussian', 0, 0.05);
imshow(uint8(gaussian_noise_2));
title('Gaussian 0.05');

%median
median_filter_gaussian_noise = nlfilter(gaussian_noise_2, [5 5], median_filter);
subplot(3,3,7);
imshow(median_filter_gaussian_noise);
title('Median Gaussian 0.05')

%gaussian
subplot(3,3,8);
gaussian_filter_gaussian_noise = conv2(gaussian_noise_2, fspecial('gaussian', 8));
imshow(uint8(gaussian_filter_gaussian_noise));
title('gaussian Gaussian 0.05')


subplot(3,3,9);
gaussian_noise_3 = imnoise(A, 'gaussian', 0, 0.1);
imshow(uint8(gaussian_noise_3));
title('Gaussian 0.1');



%Comic
edges_horizontal = conv2(double(A), fspecial('sobel'));
edges_vertical = conv2(double(A), fspecial('sobel')');
%calculate gradient magnitude
edges = sqrt(edges_horizontal .^ 2 + edges_vertical .^ 2);
%normalize image for binarize 
normalized =(edges-min(edges(:)))/(max(edges(:))-min(edges(:)));
binarized = imbinarize(uint8(edges));

figure
imshow(-binarized, []);
title('Comic Effect');

%Nlfilters
figure
%median already used in exercise 1
subplot(2,2,1);
imshow(salt_pepper_noise);
title('Original');

subplot(2,2,2);
imshow(median_filter_salt_pepper);
title('Median');
%local contrast

subplot(2,2,3);
imshow(A);
title('Original for Local Contrast');

local_contrast =@(x) (max(x(:)) - min (x(:)));
local_contrast_im = nlfilter(A, [5 5], local_contrast);

subplot(2,2,4);
imshow(local_contrast_im);
title('Local Contrast');


%Pixelize
figure
pixelate = @(block_struct) std2(block_struct.data) * ones(size(block_struct.data));

IM_blk = blockproc(A, [5 5], pixelate);
imshow(IM_blk, []);


