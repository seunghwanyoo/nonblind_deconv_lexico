function grad = func1_grad(x,y,h,~)
% Gradient of the obj. function
% Input: 
%   x: original image (vector)
%   y: degraded image (vector)
%   h: impulse response (lexicographically arranged)
% Output:
%   grad: gradient

grad = h'*h*x - h'*y;
