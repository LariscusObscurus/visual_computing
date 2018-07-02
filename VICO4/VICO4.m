%% Exercise 4 - Morphological Operators
%%

%% Loading images
art = imread('art.gif');
lines = imread('lines.gif');
holes = imread('holes.gif');
figure
imshow(lines, []);
figure
imshow(art, []);
figure
imshow(holes, []);

%% Lines extraction
% Extracting the horizontal lines
% Opening is an erosion followed by a dilation, thus lines that are not
% vertical will be completly removed by the erosion step. Since there are
% no pixels left after this step they can not be restored by the dilation step afterwards.
% The structuring element is a line approximately double the size of the
% thickest horizontal spot which is where the angled lines intersect the
% vertical lines. These are about 10px wide and would not be removed by a
% smaller structuring element.

line = strel('line', 20, 0);
figure
imshow(-line.Neighborhood,[]);
title('Horizontal structuring element.');

horizontal = imopen(lines, line);
figure
imshow(horizontal,[]);

% Extracting the vertical lines
% Same as above but the horizontal lines are eroded away instead and the
% structuring element is rotated by 90 degrees. Since the angled lines do
% not intersect any horizontal lines a smaller structuring element can be
% used.

line = strel('line',  10, 90);

figure
imshow(-line.Neighborhood,[]);
title('Vertical structuring element.');

vertical = imopen(lines, line);
figure
imshow(vertical,[]);

%% Removing lines
% Removing all lines by using a disk shaped structuring element.
% This is an opening as well so the same rules as above apply.
% A structuring element of the same size as the circles was chosen to erode
% away all lines.
% Since the lines in the middle cross right at the position where a circle is
% that circle is a bit bigger than the others. The erosion step can not
% remove the part of these lines because the structuring element is too
% small.

disk = strel('disk', 6, 0);

figure
imshow(-disk.Neighborhood,[]);
title('Disk structuring element.');

no_lines = imopen(art, disk);
figure
imshow(no_lines,[]);

%% Removing holes
% The closing operation is defined as a dilate followed by an erosion.
% Dilate makes white thing fatter so holes disappear the erosion then
% restores the previous size of all holes that did not disappear in the
% dilate step. 
%
% Using a closing operation it is possible to 'close' holes in a foreground
% object unfortunately the black circle around all disks gets also removed 
% during the dilate step of the closing operation.

disk = strel('disk', 8, 0);

figure
imshow(-disk.Neighborhood,[]);
title('Disk structuring element.');

no_small_holes = imclose(holes,disk);
figure
imshow(no_small_holes,[]);