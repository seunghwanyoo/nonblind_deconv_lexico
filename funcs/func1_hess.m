function H = func1_hess(x,y,h,~)
% Hessian of the objective function
% Input: 
%   x: original image (vector)
%   y: degraded image (vector)
%   h: impulse response (lexicographically arranged)
% Output:
%   H: Hessian

H = h'*h;       