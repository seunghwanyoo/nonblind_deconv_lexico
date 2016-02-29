function [sol] = opt_gd(obj,x0,opt,y,h,c)
% Gradient descent (steeptest descent)
% Inputs:
%   obj: functions to evaluate objective and its gradient and hessian
%   x0:  initial point
%   opt: algorithmic options
%   y: observed data
%   h: operation matrix
%   c: constraint matrix
% Output:
%   sol: solution - converged point

fprintf(' - Running Steepest Descent Method\n');

% k-th (k=0) function, gradient, hessian
objk  = obj.func(x0,y,h,c);
gradk = obj.grad(x0,y,h,c);
%hessk = obj.hess(x0,y,h,c);
xk = x0;

% options
disp(opt);
ls = 0;%opt.linesearch;
rho = opt.rho;
tol = opt.tol;
vis = opt.vis;

% param for line search
alpha = 1; % initial value
inf = 10^10; % value for infinity

tic;
k = 0;
if vis > 0
    fprintf('%6s %9s %9s %9s \n','iter','f','||grad||','alpha');
    fprintf('%6i %9.2e %9.2e %9.2e \n',k, objk, norm(gradk), alpha);
end
while 1 %Obj.func(x0+alpha*pk) < obj0 + c*alpha*grad0'*pk
    k = k+1;

    % initialization for alpha
    alpha = 1;
    alpha_u = inf;
    alpha_l = 0;

    %% Steepest Descent
    % choose direction
    pk = -gradk;
    % choose alpha
    if ls == 1
        alpha = stepsize_wolfe(alpha,alpha_l,alpha_u,obj,xk,pk,y,h,c);
    elseif ls == 2
        alpha = stepsize_backtracking(alpha,rho,obj,xk,pk,y,h);
    else
        alpha = 1;
    end
    % update values
    xk_old = xk;
    xk = xk + alpha*pk;
    %if abs(xk - xk_old) < tol %if abs(objk - objk_old) < tol
    if norm(xk-xk_old)/norm(xk_old) < tol
        fprintf('  converged at %i iter\n',k);
        break;
    end
    gradk = obj.grad(xk,y,h,c);
        
    if vis > 0
        fprintf('%6i %9.2e %9.2e %9.2e\n',k,obj.func(xk,y,h,c),norm(gradk),alpha);
    end
end
if vis > 0
    fprintf('%6i %9.2e %9.2e %9.2e\n',k,obj.func(xk,y,h,c),norm(gradk),alpha);
end
toc;

% Make sure you set the correct return values
sol = xk;
