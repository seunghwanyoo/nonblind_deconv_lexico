function alpha = stepsize_backtracking(alpha,rho,obj,xk,pk,y,h,c)
% Line search with Wolfe condition
%
% Input:
%   alpha: current alpha
%   obj: object for function handles
%   xk: current x
%   pk: direction to search
%   y: observed data
%   h: operation matrix
%   c: constraint matrix
% Output:
%   alpha: new alpha - step size
% 
% Author: Seunghwan Yoo

%rho = 0.5
c1 = 10^(-4);

while obj.func(xk + alpha*pk,y,h,c) > obj.func(xk,y,h,c) + c1*alpha*obj.grad(xk,y,h,c)'*pk
    alpha = rho * alpha;
end