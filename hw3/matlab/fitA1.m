
load reg.mat
 [U,S,V] = svd(A2);
 b = berr2;
 
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
xOverfit = x;

%comp optimal fit.
lambda = 7.0043e-04; 
x = zeros(n,1);
for i = 1:n
    f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
    x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
end
xOpt = x;

%comp overdamped solution.
lambda = max(sigma);
x = zeros(n,1);
for i = 1:n
    f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
    x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
end
xOverDmpd = x;

plot(b);
hold on;
plot(A1*xOverfit);
plot(A1*xOpt);
plot(A1*xOverDmpd);
hold off;

