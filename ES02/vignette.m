function vignette(image)
image = im2double(image);
[X,Y] = meshgrid(linspace(-1, 1, size(image, 2)), linspace(-1, 1, size(image, 1))) ;
gradient = -(X.^2 + Y.^2) ;
normalized =(gradient-min(gradient(:)))/(max(gradient(:))-min(gradient(:)));

figure
subplot(1,2,1),imshow(image);
subplot(1,2,2), imshow(image .* normalized);
end

