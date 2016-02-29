function val = func1(x,y,h,~)
% The objective function: F(x) = 1/2 ||y - hx||^2
% Input: 
%   x: original image (vector)
%   y: degraded image (vector)
%   h: impulse response (lexicographically arranged)
% Output:
%   val: objective function value

hx = h*x;
val = 0.5*(y)'*y + 0.5*(hx)'*hx - y'*hx;

