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
 sigma = diag(S);
 fVec = sigma.^2 ./ ( sigma.^2 + ones(n,1)*lambda.^2);
 F = diag(fVec);
 x =  sum(V*(diag(U'*b .* sigma.^(-1)))*F,2);
 %x = sum(U*F*diag(sigma.^(-1))*V'*b,2);     %numerically unpleasant.
 
 %denominator from SVD properties.
 denom = n - sum(fVec);
 G = norm(A*x - b)^2 / denom^2;
 
end

