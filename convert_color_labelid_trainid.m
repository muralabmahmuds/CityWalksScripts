%%% This is to convert GT from color to labelid and trainid modes %%%

close all
clear
clc

%%% INPUT IMAGE PATH HERE %%%
img_path = 'gtFine_color/val/munster_000143_000019_gtFine_color.png';

% image name
[path, name, ext] = fileparts(img_path);
img_name = [name ext];

% read the input image
inp = imread(img_path);

% convert color to labelid and trainid
[out1, out2] = color_to_labelid_trainid(inp);
%if (sum(sum(out1==99))>0 || sum(sum(out2==99))>0)   %99 is an error marker
%    disp(['Found possible error color on ' img_path]);
%end

% convert to uint8
out1 = uint8(out1);
out2 = uint8(out2);

% the outputs' names
lbid_name = strrep(img_name, '_color', '_labelid');
trid_name = strrep(img_name, '_color', '_trainid');

% save the files
imwrite(out1, lbid_name);
imwrite(out2, trid_name);
