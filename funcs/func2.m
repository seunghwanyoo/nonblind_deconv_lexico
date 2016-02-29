function val = func2(x,y,h,~)
% The objective function: F(x) = 1/2 ||y - hx||^2 + lam/2 ||x||^2
% Input: 
%   x: original image (vector)
%   y: degraded image (vector)
%   h: impulse response (lexicographically arranged)
% Output:
%   val: objective function value

lambda = 0.01; %load('lambda.mat');
hx = h*x;

val = 0.5*(y)'*y + 0.5*(hx)'*hx - y'*hx + lambda/2 *(x)'*x;

