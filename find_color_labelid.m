%%% This function is used in color_to_labelid.m %%%

function out = find_color_labelid(labels, rr, gg, bb)

% labels columns: 'labelid','trainid','catid','rcolor','gcolor','bcolor'
% labelid = 1
% rr, gg, bb = 4, 5, 6

out = 0;   % a marker when an error color may accur, 0: ignored in labelid
for ii=1:size(labels,1)
    if (labels(ii,4)==rr && labels(ii,5)==gg && labels(ii,6)==bb)
        out = labels(ii,1);
        break;
    end
end

