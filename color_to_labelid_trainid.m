%%% This function is used in convert_color_labelid_trainid.m %%%

function [out1, out2] = color_to_labelid_trainid(inp)

CW = load('CityWalks.mat');
labels = CW.labels;

out1 = zeros(size(inp,1), size(inp,2));
out2 = zeros(size(inp,1), size(inp,2));

for ii=1:size(inp,1)
    for jj=1:size(inp,2)
        [aa, bb] = find_color_labelid_trainid(labels, inp(ii,jj,1), inp(ii,jj,2), inp(ii,jj,3));
        out1(ii,jj) = aa;
        out2(ii,jj) = bb;
    end
end
