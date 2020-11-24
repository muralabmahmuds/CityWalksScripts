%%% This is to update the class' color for all images in a directory %%%

close all
clear
clc

%%% INPUT IMAGE DIRECTORY HERE %%%
dir_in = 'gtFine_color/train';
dir_out = [dir_in '_new'];

filter = '*.png';
list_img = dir([dir_in '/' filter]);

if ~exist(dir_out) %#ok<EXIST>
    mkdir(dir_out);
end

% put RGB values here if you want to change the color
old_color = [
    220 100 110;     %pedestrian-left
    200 20  100];    %pedestrian-front
% put new RGB values here correspondingly to the above old colors
new_color = [
    118 214 255;     %pedestrian-left
    220 100 110];    %pedestrian-front

% read per image
for mm=1:length(list_img)
    img = imread([dir_in '/' list_img(mm).name]);
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
    imwrite(img2, [dir_out '/' list_img(mm).name]);
end
