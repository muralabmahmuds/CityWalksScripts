%%% This is to convert GT from color to labelid and trainid modes for all images in a directory %%%

close all
clear
clc

%%% INPUT IMAGE DIRECTORY HERE %%%
dir_in = 'gtFine_color/train';
dir_lbout = 'gtFine_labelid/train';
dir_trout = 'gtFine_trainid/train';

filter = '*.png';
list_img = dir([dir_in '/' filter]);

if ~exist(dir_lbout) %#ok<EXIST>
    mkdir(dir_lbout);
end
if ~exist(dir_trout) %#ok<EXIST>
    mkdir(dir_trout);
end

% read per image
for mm=1:length(list_img)
    % image path
    img_path = [dir_in '/' list_img(mm).name];
    
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
    imwrite(out1, [dir_lbout '/' lbid_name]);
    imwrite(out2, [dir_trout '/' trid_name]);

end
