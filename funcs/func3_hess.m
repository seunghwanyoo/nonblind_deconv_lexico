function H = func3_hess(x,y,h,c)
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

H = hth + lambda*(c)'*c;