
load reg.mat
 [U,S,V] = svd(A3);
 b = berr4;
 A = A4;
 
 sigma = diag(S);
 s = size(A1);
 n = s(1);
% comp xOverfit 
lambda = min(sigma) ;
x = zeros(n,1);
for i = 1:n
    f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
    x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
end
xOff = x;

%comp optimal fit.
xOpt = tikhonov(A,b,15,false);

%comp overdamped solution.
lambda = max(sigma);
x = zeros(n,1);
for i = 1:n
    f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
    x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
end
xDmpd = x;

plot(b);
hold on;
%plot(A1*xOff);
plot(A1*xOpt);
plot(A1*xDmpd);
hold off;

