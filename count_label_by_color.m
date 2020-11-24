%%% This is for counting the label occurances in the ground truth for all images in a folder %%%

close all
clear
clc

%%% INPUT IMAGE DIRECTORY HERE %%%
lab_folder = {'gtFine_color/val'};  % set designated folder(s)

labels = [-1, 0:50, 255];   % all possible labels
filter = '*.png';

for ff=1:length(lab_folder)
    
    disp([lab_folder{ff} ' ...']);
    
    lab_list = dir([lab_folder{ff} '/' filter]);
    
    lab_count = zeros(length(lab_list), length(labels));
    for ii=1:length(lab_list)
        %disp(ii);
        img = imread(fullfile(lab_folder{ff}, lab_list(ii).name));
        
        % convert color to labelid OR trainid (choose which one)
        %lab = color_to_labelid(img);    % this uses labelid
        lab = color_to_trainid(img);    % this uses trainid
        if sum(sum(lab==99))>0   % 99 is an error marker
            disp(['Found possible error color on ' inp_list(ii).name]);
        end
        lab = uint8(lab);
        
        for jj=1:length(labels)
            lab_count(ii,jj) = sum(lab(:)==labels(jj));
        end
    end
    
    total = sum(lab_count);
    
    for aa=1:length(total)
        if total(aa)~=0
            disp([num2str(labels(aa)) ' = ' num2str(total(aa))]);
        end
    end
    
    %save(['labels_' lab_folder{ff} '.mat'], 'lab_count', 'labels', 'total');
    
end