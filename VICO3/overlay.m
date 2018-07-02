function [result_img] = overlay(img,mask)	
%
% function [result_img] = overlay(img,mask).
% ------------------------------------------------------------------
% Wandelt das Bild <img> in ein Grauwertbild um und markiert die in
% <mask> angegebenen Pixel rot. Das Resultat wird zurückgegeben

    result_img_r = rgb2gray(img);
    result_img_g = rgb2gray(img);
    result_img_b = rgb2gray(img);
    result_img_r(mask) = 255;
    result_img_g(mask) = 0;
    result_img_b(mask) = 0;
    
    result_img(:,:,1) = result_img_r;
    result_img(:,:,2) = result_img_g;
    result_img(:,:,3) = result_img_b;
end