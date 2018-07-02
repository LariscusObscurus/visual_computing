%% Exercise 3
% Movement detection
%%
% Loading images and playing them as a video:
previous_img = [];
figure
for idx=0:299
    filename = sprintf('images/%04d.jpg',idx);
    img = imread(filename);
    if (isempty(previous_img))
        previous_img = img;
        continue;
    end
    difference = img - previous_img;
    mask = any(difference > 50, 3);
    result = overlay(img, mask);
    
    previous_img = img;
           
    imshow(result)
end
%%
% Choosing a too small sigma leads to many false positives because of noise
% in the video.
figure
first_img = imread('images/0100.jpg');
second_img = imread('images/0101.jpg');
difference = second_img - first_img;
mask = any(difference > 10, 3);
result = overlay(second_img, mask);
imshow(result)
%%
% A sigma of 50 seems to work well for this specific video but also reduces
% the amount of valid 'moved' pixels. Also while this value may work with 
% this video others could have more or less noise leading to varying results.
figure
first_img = imread('images/0100.jpg');
second_img = imread('images/0101.jpg');
difference = second_img - first_img;
mask = any(difference > 50, 3);
result = overlay(second_img, mask);
imshow(result)

%% Colour Mean & Treshold
% Mean over the first 81 images
figure
sum_image = zeros(240, 320, 3);
for idx=0:80
    filename = sprintf('images/%04d.jpg',idx);
    img = imread(filename);
    sum_image = sum_image + im2double(img);
end
mean_image = im2uint8(sum_image / 81);
imshow(mean_image);
%%
% Now the video shows even a person that is standing completly still. It
% also shows almost every pixel of the person and not just the edges where
% movement occurred in the previous frame. Unfortunatly it also shows
% the shadow of a person and holes appear when the person is wearing
% something similarly colored as the mean background.
figure
for idx=0:250
    filename = sprintf('images/%04d.jpg',idx);
    img = imread(filename);
    difference = mean_image - img;
    tmp = difference > 50;
    mask = any(tmp, 3);
    result = overlay(img, mask);
           
    imshow(result)
end

%%
% Mean over the images 80 to 120. Since a person enters the room over the
% sampling period a grey spot can be seen in the area around the door. This
% is probably what was meant by 'Ghost'. Using a median instead of a mean
% would probably reduce or even eliminate this problem because the person 
% occupies the area only for a short amount of time. 

figure
sum_image = zeros(240, 320, 3);
for idx=80:120
    filename = sprintf('images/%04d.jpg',idx);
    img = imread(filename);
    sum_image = sum_image + im2double(img);
end
mean_image = im2uint8(sum_image / 41);
imshow(mean_image);

%%
% Because of the 'Ghost' in the area around the door, movement is not detected
% properly in this area and more holes appear where movement should be detected.

figure
for idx=121:299
    filename = sprintf('images/%04d.jpg',idx);
    img = imread(filename);
    difference = mean_image - img;
    tmp = difference > 50;
    mask = any(tmp, 3);
    result = overlay(img, mask);   
          
    imshow(result)
end

%%
% A closer look at the 'holes'.
figure
second_img = imread('images/0250.jpg');
difference = mean_image - second_img;
mask = any(difference > 50, 3);
result = overlay(second_img, mask);
imshow(result)