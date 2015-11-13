function [ G ] = gcv( lambda,U,S,V,A,b )
% gcv( f,U,S,V,A,b )
% Implementation of the generalized cross validation function.

 s = size(A);
 if (s(1)  ~=  s(2))
     warning('input assumed to be square')
 end
 n = s(1);
 x= zeros(n,1);

 %G = norm(A*x - b)^2 / (trace(eye(size(A)) - A*A'))^2;
 %compute x
 for i = 1:n
     f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
     x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
 end
 
 %denominator from SVD properties.
 denom = n - sum(diag(S).^2*f);
 G = norm(A*x - b)^2 / denom^2;
 
end

