%se17m019 Leonhardt Schwarz

A = imread('coins.png');

%A = rgb2gray(A);

% 1. iterative optimal thresholding
threshold = optimal_threshold(A);

figure
BW = imbinarize(A, threshold/255);
imshow(BW,[]);

% 3. Evalutation
figure
camera_man = imread('cameraman.tif');

subplot(2,2,1);
threshold = optimal_threshold(camera_man);
BW = imbinarize(camera_man, threshold/255);
imshow(BW,[]);
title('Iterative Optimal Function');

subplot(2,2,2);
threshold = graythresh(camera_man);
BW = imbinarize(camera_man, threshold);
imshow(BW,[]);
title('Matlab Function');

subplot(2,2,3);
threshold = mode_method(camera_man);
BW = imbinarize(camera_man, threshold);
imshow(BW,[]);
title('Mode Method');

subplot(2,2,4);
camera_man_thruth = imread('camera_man.png');
imshow(camera_man_thruth,[]);
title('Ground Truth');


figure
ean = imread('ean.jpg');
ean = rgb2gray(ean);

subplot(2,2,1);
threshold = optimal_threshold(ean);
BW = imbinarize(ean, threshold/255);
imshow(BW,[]);
title('Iterative Optimal Function');

subplot(2,2,2);
threshold = graythresh(ean);
BW = imbinarize(ean, threshold);
imshow(BW,[]);
title('Matlab Function');

subplot(2,2,3);
threshold = mode_method(ean);
BW = imbinarize(ean, threshold);
imshow(BW,[]);
title('Mode Method');

subplot(2,2,4);
ean_truth = imread('ean_truth.jpg');
imshow(ean_truth,[]);
title('Ground Truth');



figure
page = imread('page.jpg');
page = rgb2gray(page);

subplot(2,2,1);
threshold = optimal_threshold(page);
BW = imbinarize(page, threshold/255);
imshow(BW,[]);
title('Iterative Optimal Function');

subplot(2,2,2);
threshold = graythresh(page);
BW = imbinarize(page, threshold);
imshow(BW,[]);
title('Matlab Function');

subplot(2,2,3);
threshold = mode_method(page);
BW = imbinarize(page, threshold);
imshow(BW,[]);
title('Mode Method');

subplot(2,2,4);
page_truth = imread('page_truth.jpg');
imshow(page_truth,[]);
title('Ground Truth');
