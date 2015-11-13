function [ xReg ] = tikhonovGCV( A,b)
 %tikhonov( A,b,plotting )
%use plain tikhonov regularization to find a solution.
 %A - input Matrix     dimension n*n
 %b - right hand side  dimension n*1
 %plotting - logical true if plots are desired false if not.
 
 s = size(A);
 if (s(1)  ~=  s(2))
     warning('input assumed to be square')
 end
 n = s(1);
 
 
 %% compute svd
 [U,S,V] = svd(A);
  
 %% find the regularization parameter.
 lambda = fminbnd(@(f) gcv(f,U,S,V,A,b),S(end,end),S(1,1));
 

 xReg = zeros(n,1);
 for i = 1:n
     f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
     xReg = xReg + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
 end

end

