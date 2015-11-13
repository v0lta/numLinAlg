function [ Q,T ] = lanczos( A )
%[ Q,T ] = lanczos( A )
%Use lanczos iterations to compute a tridiagonal matrix T and 
%a transformation matrix Q such that A = Q*A*Q'.

s = size(A);
n = s(1);

Q = zeros(n);
T = zeros(n);
b = randn(n,1);
beta = 0;
Q(:,1) = b/norm(b);

    
for k = 1:(n-1)
 
    v = A*Q(:,k);
    alpha = Q(:,k)'*v;
    if (k == 1)
      v = v - alpha*Q(:,k);
    else
      v = v - alpha*Q(:,k) - beta*Q(:,k-1);
    end
    beta = norm(v);
    Q(:,k+1) = v/beta;
    
    T(k,k) = alpha;
    T(k,k+1) = beta;
    T(k+1,k) = beta;
end
v = A*Q(:,n);
alpha = Q(:,n)'*v;
T(n,n) = alpha;

    

end

