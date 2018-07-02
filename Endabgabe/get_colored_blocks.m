function [red_objects, green_objects, blue_objects, cylinder_objects, cuboid_objects] = get_colored_blocks(A)
% returns the number of colored blocks in the image

A_gray = rgb2gray(A); 
A_gray = imadjust(A_gray);

padding_size = 50;
A_padded = padarray(A_gray, [padding_size padding_size], 255, 'both');

%tried using a median filter but it did not play well with graythresh
%A_median = medfilt2(A_padded, [padding_size padding_size]); 

%gauss filter reduces reflections at least a bit
A_gauss = imgaussfilt(A_padded, 2);
A_gauss = A_gauss(padding_size+1:end-padding_size,padding_size+1:end-padding_size);

A_thresh = graythresh(A_gauss);
A_BW = imbinarize(A_gauss, A_thresh);
A_BW = imcomplement(A_BW);

%remove small blobs
structure = strel('disk', 25, 8);
A_BW = imclose(A_BW, structure);
A_BW = imopen(A_BW, structure);

%label blobs
[labels] = bwlabeln(A_BW);

stats = regionprops(labels, 'Centroid', 'MajorAxisLength','MinorAxisLength');
blob_measurements = [stats.MajorAxisLength; stats.MinorAxisLength]';
centroids = cat(1, stats.Centroid);

figure
subplot(1,2, 1);
hold on;
imshow(A);
plot(centroids(:,1), centroids(:,2), 'b*');

subplot(1,2, 2);
imshow(A_BW);

red_objects = 0;
green_objects = 0;
blue_objects = 0;

cylinder_objects = 0;
cuboid_objects = 0;


%just to make sure 
assert(numel(centroids(:,1)) == numel(blob_measurements(:,1)));

for i = 1:numel(centroids(:,1))
    col = uint32(centroids(i, 1));
    row = uint32(centroids(i, 2));
    pixel_value = A(row, col, :);
    
    red = pixel_value(1);
    green = pixel_value(2);
    blue = pixel_value(3);
    
    %determine colors
    if red > green
        if red > blue
            red_objects = red_objects + 1;
        else
            blue_objects = blue_objects + 1;
        end
    else
        if green > blue
            green_objects = green_objects + 1;
        else
            blue_objects = blue_objects + 1;
        end
    end
    
    %determine shape does not work very well because a square fits a
    %ellipsis that is almost circular. regionprops.Eccentricity has similar
    %problems. 
    major_axis = blob_measurements(i, 1);
    minor_axis = blob_measurements(i, 2);
    if (abs(major_axis - minor_axis) < 50)
        cylinder_objects = cylinder_objects + 1;
    else
        cuboid_objects = cuboid_objects + 1;
    end
end

end

