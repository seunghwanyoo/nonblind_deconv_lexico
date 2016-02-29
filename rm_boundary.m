function out = rm_boundary(img,bm,bn)
% remove the boundary of an input image with bm for top and bottom, and bn
% for sides
% Input:
%   img: input image
%   bm: thickness of top and bottom to be removed
%   bn: thickness of left and right to be removed
% Output:
%   out: trimmed image

out = img(bm+1:end-bm,bn+1:end-bn);