function [] = cptnPicard( A,b)
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
 sigma = diag(S);
  
 for k = 1:n
         %f = S(k,k)^2 / (S(k,k)^2 + lambda(k)^2); 
         %x = x + ((U(:,k)'*b)/S(k,k)) * V(:,k);  
         utb(k) = norm(U(:,k)' * b);
 end
 
 %figure(1)
 loglog(1:n,sigma)
 hold on
 loglog(1:n,utb);
 
 [~,lambda] = tikhonov(A,b,15,false);
  for k = 1:n
         f = S(k,k)^2 / (S(k,k)^2 + lambda^2); 
         %x = x + ((U(:,k)'*b)/S(k,k)) * V(:,k);  
         futb(k) = norm(f*U(:,k)' * b);
 end
 loglog(1:n,futb);
 legend({'$\sigma$','$\|u_,^T b\|$','$\|f u_,^T b\|$'},'Interpreter','Latex')
 hold off
 
end

