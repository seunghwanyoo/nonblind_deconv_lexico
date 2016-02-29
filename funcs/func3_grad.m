function grad = func3_grad(x,y,h,c)
% Gradient of the obj. function
% Input: 
%   x: original image (vector)
%   y: degraded image (vector)
%   h: impulse response (lexicographically arranged)
% Output:
%   grad: gradient

lambda = 0.01;
%load('lambda.mat');

grad = (h)'*h*x - (h)'*y + lambda*(c)'*c*x;
