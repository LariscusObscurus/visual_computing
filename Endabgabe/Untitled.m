A = imread('BLOCKS_001.jpg');
A = imresize(A, 0.3);

[red_objects, green_objects, blue_objects, cylinder_objects, cuboid_objects] = get_colored_blocks(A);

%Requirements: 1 & 2
fprintf('There are %d red objects, %d green objects and %d blue objects.\n', red_objects, green_objects, blue_objects);


%Broken for the most part
fprintf('There are %d cylinders and %d cuboids.\n', cylinder_objects, cuboid_objects);