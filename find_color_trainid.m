%%% This function is used in color_to_trainid.m %%%

function out = find_color_trainid(labels, rr, gg, bb)

% labels columns: 'labelid','trainid','catid','rcolor','gcolor','bcolor'
% trainid = 2
% rr, gg, bb = 4, 5, 6

out = 255;   % a marker when an error color may accur, 255: ignored in trainid
for ii=1:size(labels,1)
    if (labels(ii,4)==rr && labels(ii,5)==gg && labels(ii,6)==bb)
        out = labels(ii,2);
        break;
    end
end

