I = imread('bug.jpg');
I_gray = rgb2gray(I);

%window
figure
window_itf = window(50, 49);
window_img = applyITF(I_gray, window_itf);
imshow(window_img);

%gamma
figure
gamma_itf = gamma_2(0.5, 128, 127);
gamma_img = applyITF(I_gray, gamma_itf);
imshow(gamma_img);

%sigmoid
sigmoid_img = applyITF(I_gray, sigmoid(50,75));
imshow(sigmoid_img);

% Contrast enhancement
B = imread('bad_contrast.jpg');
B_gray = rgb2gray(B);

figure;
subplot(2,3,1);
imshow(B_gray);
title('Original');

[counts, binlocations] = imhist(B_gray);
equalization_itf = cumsum(counts) / numel(B_gray);

subplot(2,3,2);
equalized_image = applyITF(B_gray, equalization_itf);
imshow(equalized_image);
title('Enhanced Contrast');

subplot(2,3,3);
histogram(B_gray);
title('Histogram original');

subplot(2,3,4);
histogram(equalized_image);
title('Histogram enhanced contrast');

subplot(2,3,5);
plot(equalization_itf);
title('ITF');

%Posterize
P = im2uint8(equalized_image);

figure
subplot(2,3,1);
imshow(P);
title('Original');

[posterized, posterization_itf] = posterize(P, 3);

subplot(2,3,2);
imshow(posterized);
title('Posterized');

subplot(2,3,3);
histogram(P);
title('Histogram original');

subplot(2,3,4);
histogram(posterized);
title('Histogram posterized');

subplot(2,3,5);
plot(posterization_itf);
title('ITF');

%Whitebalance
H = imread('hexe_mit_ninja_sternen.png');

reference_pixel = impixel(H);

R_channel = H(:,:,1) .* (255/reference_pixel(1));
G_channel = H(:,:,2) .* (255/reference_pixel(2));
B_channel = H(:,:,3) .* (255/reference_pixel(3));

balanced_image = cat(3, R_channel, G_channel, B_channel);

figure
subplot(2,2,1);
imshow(H);
title('Original');

subplot(2,2,2);
imshow(balanced_image);
title('Whitebalanced');

subplot(2,2,3);
histogram(H);
title('Histogram original');

subplot(2,2,4);
histogram(balanced_image);
title('Histogram Whitebalanced');

