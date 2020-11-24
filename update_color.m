%%% This is to update the class' color for a single image %%%

close all
clear
clc

%%% INPUT IMAGE PATH HERE %%%
img_path = 'gtFine_color/val/munster_000143_000019_gtFine_color.png';

% image name
[path, name, ext] = fileparts(img_path);
img_name = [name ext];

% put RGB values here if you want to change the color
old_color = [
    220 100 110;     %pedestrian-left
    200 20  100];    %pedestrian-front
% put new RGB values here correspondingly to the above old colors
new_color = [
    118 214 255;     %pedestrian-left
    220 100 110];    %pedestrian-front

% read the input image
img = imread(img_path);
img2 = img;
% trace per color to be changed
for nn=1:size(old_color,1)
    % trace per pixel
    for ii=1:size(img,1)
        for jj=1:size(img,2)
            % change if conditions satisfied
            if img(ii,jj,1)==old_color(nn,1) && img(ii,jj,2)==old_color(nn,2) && img(ii,jj,3)==old_color(nn,3)
                img2(ii,jj,1) = new_color(nn,1);
                img2(ii,jj,2) = new_color(nn,2);
                img2(ii,jj,3) = new_color(nn,3);
            end
        end
    end
end
img2 = uint8(img2);
img2_name = strrep(img_name, '_color', '_color_');  % to avoid file overwriting
imwrite(img2, img2_name);
