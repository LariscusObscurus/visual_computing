% Exercise 1
img = imread('eule.png');
A = im2double(img);
A_rotated = imrotate(A, -180);
A_inverted = imcomplement(A_rotated);

A_top = A_inverted(1:300,:);
A_bottom = A_inverted(301:450,:);

A_complete = [A_bottom; A_top];

kernel(1:3, 1:3) = 1/9;
A_filtered = conv2(A_complete, kernel);
imshow(A_filtered);

% Exercise 2
img = imread('lena.png');
A = im2double(img);
imshow(A, []);

average = fspecial('average', 5); %averaging block filter
motion = fspecial('motion', 20, 45); %len length of motion, theta angle of motion
sobel = fspecial('sobel'); %horizontal edge detection in 

% full - uses zeroes outside of image area -> black borders
% same - ??? result image stays same size -> lighter black borders
% valid - cuts off invalid convolution parts. smaller image -> no black borders

A_average_full = conv2(A, average, 'full');
A_average_same = conv2(A, average, 'same');
A_average_valid = conv2(A, average, 'valid');

A_motion_full = conv2(A, motion, 'full');
A_motion_same = conv2(A, motion, 'same');
A_motion_valid = conv2(A, motion, 'valid');

A_sobel_full = conv2(A, sobel, 'full');
A_sobel_same = conv2(A, sobel, 'same');
A_sobel_valid = conv2(A, sobel, 'valid');


figure;

subplot(3,3,1);
imshow(A_average_full, []);
title('average full')
subplot(3,3,2);
imshow(A_average_same, []);
title('average same')
subplot(3,3,3);
imshow(A_average_valid, []);
title('average valid')

subplot(3,3,4);
imshow(A_motion_full, []);
title('motion full')
subplot(3,3,5);
imshow(A_motion_same, []);
title('motion same')
subplot(3,3,6);
imshow(A_motion_valid, []);
title('motion valid')

subplot(3,3,7);
imshow(A_sobel_full, []);
title('sobel full')
subplot(3,3,8);
imshow(A_sobel_same, []);
title('sobel same')
subplot(3,3,9);
imshow(A_sobel_valid, []);
title('sobel valid')