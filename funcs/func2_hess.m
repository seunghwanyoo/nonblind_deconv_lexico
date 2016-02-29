function H = func2_hess(x,y,h,~)
% Hessian of the objective function
% Input: 
%   x: original image (vector)
%   y: degraded image (vector)
%   h: impulse response (lexicographically arranged)
% Output:
%   H: Hessian

lambda = 0.01;
%load('lambda.mat');
hth = h'*h;

H = hth + lambda*eye(size(hth));