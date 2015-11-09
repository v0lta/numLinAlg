function [ xReg ] = cg( A,b, it )
% compute x from a n by n matrix A and a n by 1 vactor b. Using the con-
% jugate gradient method. 
% A n by n intput matrix
% b n by 1 right hand side
% it #iterations desired.

if (nargin < 3)
    disp('no iteration number provided setting it to length(b).')
    it = length(b);
end

r = b;
p = r;
x = 0*p;
rsOld = r'*r;

for n = 1:it
    Ap = A*p;
    alpha = rsOld/(p'*Ap);    % step length.
    x = x + alpha*p;          % approximate solution.
    r = r - alpha*Ap;         % residual
    rsNew = r'*r;
    beta = (rsNew)/(rsOld);   % improvement of previous step.
    p = r + beta*p;           % search direction.
    
    rsOld = rsNew;            % squared residual update.
end

xReg = x;
