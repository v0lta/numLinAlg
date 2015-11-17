function [ xReg ] = cgNorm( AO,bO)
% compute x from a n by n matrix A and a n by 1 vactor b. Using the con-
% jugate gradient method. 
% A n by n intput matrix
% b n by 1 right hand side
% it #iterations desired.

A = AO;
b = bO;

it = length(b);
r = b;
p = r;
x = 0*p;
rsOld = r'*r;
xVec = zeros(length(b),it);
solNormVec = zeros(1,it);
resNormVec = zeros(1,it);

for n = 1:it
    Ap = A*p;
    alpha = rsOld/(p'*Ap);    % step length.
    x = x + alpha*p;          % approximate solution.
    r = r - alpha*Ap;         % residual
    rsNew = r'*r;
    beta = (rsNew)/(rsOld);   % improvement of previous step.
    p = r + beta*p;           % search direction.
    
    rsOld = rsNew;            % squared residual update.
    
    xVec(:,n) = x;
    solNormVec(n) = norm(A*x-b);
    resNormVec(n) = norm(A*x);

end

semilogy(1:it,solNormVec) 
hold on
semilogy(1:it,resNormVec)
[val,I] = min(solNormVec)
semilogy(I,val,'*')


xReg = x(I);

A = AO'*AO;
b = AO'*b;


it = length(b);
r = b;
p = r;
x = 0*p;
rsOld = r'*r;
xVec = zeros(length(b),it);
solNormVec = zeros(1,it);
resNormVec = zeros(1,it);

for n = 1:it
    Ap = A*p;
    alpha = rsOld/(p'*Ap);    % step length.
    x = x + alpha*p;          % approximate solution.
    r = r - alpha*Ap;         % residual
    rsNew = r'*r;
    beta = (rsNew)/(rsOld);   % improvement of previous step.
    p = r + beta*p;           % search direction.
    
    rsOld = rsNew;            % squared residual update.
    
    xVec(:,n) = x;
    solNormVec(n) = norm(AO*x-bO);
    resNormVec(n) = norm(AO*x);

end

semilogy(1:it,solNormVec) 
hold on
semilogy(1:it,resNormVec)
[val,I] = min(solNormVec)
semilogy(I,val,'*')
hold off;

xReg = x(I);

