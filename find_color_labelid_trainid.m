%%% This function is used in color_to_labelid_trainid.m %%%

function [out1, out2] = find_color_labelid_trainid(labels, rr, gg, bb)

% labels columns: 'labelid','trainid','catid','rcolor','gcolor','bcolor'
% labelid = 1, trainid = 2
% rr, gg, bb = 4, 5, 6

out1 = 99;   % the error marker
out2 = 99;   % the error marker
for ii=1:size(labels,1)
    if (labels(ii,4)==rr && labels(ii,5)==gg && labels(ii,6)==bb)
        out1 = labels(ii,1);
        out2 = labels(ii,2);
        break;
    end
end

