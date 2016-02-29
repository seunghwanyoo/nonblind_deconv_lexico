function alpha = stepsize_wolfe(alpha,alpha_l,alpha_u,obj,xk,pk,y,h,c)
% Line search with Wolfe condition
%
% Input:
%   alpha: current alpha
%   alpha_l: lower bound
%   alpha_u: upper bound
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

c1 = 10^(-4);
c2 = 0.9;
inf = 10^10;

while 1 
    if (obj.func(xk+alpha*pk,y,h,c) > (obj.func(xk,y,h,c) + c1*alpha*obj.grad(xk,y,h,c)'*pk))
        alpha_u = alpha;
    else
        if (obj.grad(xk+alpha*pk,y,h,c)'*pk < c2*obj.grad(xk,y,h,c)'*pk)
            alpha_l = alpha;
        else
            break;
        end
    end
    if alpha_u < inf
        alpha = (alpha_l+alpha_u) / 2;
    else
        alpha = 2 * alpha_l;
    end
end        
