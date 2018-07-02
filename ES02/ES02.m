%se17m019  -Leonhardt Schwarz

% 15 puzzle
% a
A = imread('15-puzzle_scrambled.jpg');
A_rotated = imrotate(A, -35);
figure;
imshow(A_rotated);

A_cropped = A_rotated(698:2169, 698:2169);
figure
imshow(A_cropped);

part_1 = A_cropped(1:595, 1:400);
part_2 = A_cropped(1:595, 400:1471);
part_3 = A_cropped(595:1472, 1:400);
part_4 = A_cropped(595:1472, 400:1471);

A_complete = [part_4, part_3; part_2, part_1];
figure
imshow(A_complete);

imwrite(A_complete, 'ES02/15-puzzle_restored.jpg');

% b
A_cropped_background = A_complete(177:1333, 145:1334);
imwrite(A_cropped_background, 'ES02/15-puzzle_cropped.png');

%c
tile_1 = A_complete(260:483, 240:485);
tile_2 = A_complete(260:483, 485:730);
tile_3 = A_complete(260:483, 730:974);
tile_4 = A_complete(260:483, 974:1221);
tile_5 = A_complete(483:738, 230:483);
tile_6 = A_complete(483:738, 485:730);
tile_7 = A_complete(483:738, 730:974);
tile_8 = A_complete(483:738, 974:1221);
tile_9 = A_complete(738:994, 230:483);
tile_10 = A_complete(738:994, 485:730);
tile_11 = A_complete(738:994, 730:974);
tile_12 = A_complete(738:994, 974:1221);
tile_13 = A_complete(994:1264, 230:483);
tile_14 = A_complete(994:1264, 485:730);
tile_15 = A_complete(994:1264, 730:974);
tile_empty = A_complete(994:1264, 974:1221);

tile_1_64 = imresize(tile_1, [64, 64]);
tile_2_64 = imresize(tile_2, [64, 64]);
tile_3_64 = imresize(tile_3, [64, 64]);
tile_4_64 = imresize(tile_4, [64, 64]);
tile_5_64 = imresize(tile_5, [64, 64]);
tile_6_64 = imresize(tile_6, [64, 64]);
tile_7_64 = imresize(tile_7, [64, 64]);
tile_8_64 = imresize(tile_8, [64, 64]);
tile_9_64 = imresize(tile_9, [64, 64]);
tile_10_64 = imresize(tile_10, [64, 64]);
tile_11_64 = imresize(tile_11, [64, 64]);
tile_12_64 = imresize(tile_12, [64, 64]);
tile_13_64 = imresize(tile_13, [64, 64]);
tile_14_64 = imresize(tile_14, [64, 64]);
tile_15_64 = imresize(tile_15, [64, 64]);
tile_empty_64 = imresize(tile_empty, [64, 64]);

imwrite(tile_1_64, 'ES02/tile_1.png');
imwrite(tile_2_64, 'ES02/tile_2.png');
imwrite(tile_3_64, 'ES02/tile_3.png');
imwrite(tile_4_64, 'ES02/tile_4.png');
imwrite(tile_5_64, 'ES02/tile_5.png');
imwrite(tile_6_64, 'ES02/tile_6.png');
imwrite(tile_7_64, 'ES02/tile_7.png');
imwrite(tile_8_64, 'ES02/tile_8.png');
imwrite(tile_9_64, 'ES02/tile_9.png');
imwrite(tile_10_64, 'ES02/tile_10.png');
imwrite(tile_11_64, 'ES02/tile_11.png');
imwrite(tile_12_64, 'ES02/tile_12.png');
imwrite(tile_13_64, 'ES02/tile_13.png');
imwrite(tile_14_64, 'ES02/tile_14.png');
imwrite(tile_15_64, 'ES02/tile_15.png');

% d
tiles_reordered = [ tile_15_64, tile_14_64, tile_13_64, tile_12_64;
    tile_11_64, tile_10_64, tile_9_64, tile_8_64;
    tile_7_64, tile_6_64, tile_5_64, tile_4_64;
    tile_3_64, tile_2_64, tile_1_64, tile_empty_64;
];

imwrite(tiles_reordered, 'ES02/15-puzzle_reversed.png');

% e
figure
plot(diag(A));

% f
figure
ax_1 = subplot(2, 2, 1);
ax_2 = subplot(2, 2, 2);
ax_3 = subplot(2, 2, 3);
ax_4 = subplot(2, 2, 4);

hold (ax_1, 'on');
hold (ax_2, 'on');
hold (ax_3, 'on');
hold (ax_4, 'on');

title(ax_1, 'Min');
title(ax_2, 'Max');
title(ax_3, 'Mean');
title(ax_4, 'Median');

xlabel(ax_1, 'Columns');
xlabel(ax_2, 'Columns');
xlabel(ax_3, 'Columns');
xlabel(ax_4, 'Columns');

ylabel(ax_1, 'Intensity');
ylabel(ax_2, 'Intensity');
ylabel(ax_3, 'Intensity');
ylabel(ax_4, 'Intensity');

axis([ax_1  ax_2  ax_3  ax_4], [1 250 1 300]);

tiles = {tile_1, tile_2, tile_3, tile_4, tile_5, tile_6, tile_7, tile_8, tile_9, tile_10, tile_11, tile_12, tile_13, tile_14, tile_15};
for i = 1:15
    tile_min = min(tiles{i});
    tile_max = max(tiles{i});
    tile_mean = mean(tiles{i});
    tile_median = median(tiles{i});
    
    plot(ax_1, tile_min);
    plot(ax_2, tile_max);
    plot(ax_3, tile_mean);
    plot(ax_4, tile_median);
end

% Color Images
W = imread('weps.jpg');

%seperate RGB
mono_red = W(:,:,1); % Red channel
mono_green = W(:,:,2); % Green channel
mono_blue = W(:,:,3); % Blue channel

zero_mat = zeros(size(W, 1), size(W, 2));

red = cat(3, mono_red, zero_mat, zero_mat);
green = cat(3, zero_mat, mono_green, zero_mat);
blue = cat(3, zero_mat, zero_mat, mono_blue);

gray = rgb2gray(W);
[indexed, map] = rgb2ind(W, 256);

% changing the colormap by flipping it 
map = fliplr(map);

figure
subplot(3,2,1), imshow(W);
subplot(3,2,2), imshow(red);
subplot(3,2,3), imshow(green);
subplot(3,2,4), imshow(blue);
subplot(3,2,5), imshow(gray);
subplot(3,2,6), imshow(indexed, map);

% HSV
figure
HSV = rgb2hsv(W);
saturation = HSV;
saturation(:,:,2) = HSV(:,:,2) .* 1.5;

brightness = HSV;
brightness(:,:,3) = HSV(:,:,3) .* 1.5;

color = HSV;
saturation_channel = 360 * HSV(:,:,1);
color(:,:,1) = (mod(saturation_channel + 270, 360)) / 360; % rotate hue by 270 degrees

subplot(1,4,1), imshow(W);
subplot(1,4,2), imshow(hsv2rgb(saturation));
subplot(1,4,3), imshow(hsv2rgb(brightness));
subplot(1,4,4), imshow(hsv2rgb(color));


%Vignette

H = imread('heresy.png');
vignette(H);

%Color isolation
figure
W = imread('weps.jpg');
W_hsv = rgb2hsv(W);
hue_channel = W_hsv(:,:, 1);
saturation_channel = W_hsv(:,:, 2);

%poly = roipoly(W);
%mask = repmat(poly, [1,1,3]);
%roi = W_hsv;
%roi(mask) = 0;
%dominant_color = mean(mean(roi(:,:,1)));
%hue = dominant_color(:,:, 1);

dominant_color = impixel(W_hsv);
hue = dominant_color(1);

upper_threshold = hue + 0.03;
lower_threshold = hue - 0.03;

saturation_channel(hue_channel < lower_threshold) = 0;
saturation_channel(hue_channel > upper_threshold) = 0;
W_hsv(:,:, 2) = saturation_channel;
W_effect = hsv2rgb(W_hsv);
imwrite(W_effect, 'ES02/weps_effect.png');
imshow(W_effect);