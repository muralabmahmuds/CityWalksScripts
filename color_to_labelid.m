%%% This function is used in convert_color_labelid.m %%%

function out = color_to_labelid(inp)

CW = load('CityWalks.mat');
labels = CW.labels;

out = zeros(size(inp,1), size(inp,2));

for ii=1:size(inp,1)
    for jj=1:size(inp,2)
        out(ii,jj) = find_color_labelid(labels, inp(ii,jj,1), inp(ii,jj,2), inp(ii,jj,3));
    end
end
