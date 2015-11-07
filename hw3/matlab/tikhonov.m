function [ xReg ] = tikhonov( A,b )
 %use plain tikhonov regularization to find a solution.
 
 s = size(A);
 if (s(1)  ~=  s(2))
     warning('input assumed to be square')
 end
 n = s(1);
 
 %% compute svd
 [U,S,V] = svd(A);
  
 %% construct the L1 curve.
 %chose appropriate range.
 lambda = logspace(log10(S(end,end)),log10(S(1,1)),n);
 
 %find the L1 curve
 %plot norm(L*x_reg) against norm(A*x - b)
 L = eye(size(A));
 x = zeros(n,1);
 
 regSolNorm = zeros(n,1);
 residlNorm = zeros(n,1);
 
 
 for k = 1:n
     x = zeros(n,1);
     for i = 1:n
        f = S(i,i)^2 / (S(i,i)^2 + lambda(k)^2); 
        x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
        %x(:,i) = x(:,i) * f*
     end
     regSolNorm(k) = norm(L*x);
     residlNorm(k) = norm(A*x - b);
 end
 
 figure(1)
 loglog(lambda,residlNorm)
 hold on
 loglog(lambda,regSolNorm)
 xlabel('lambda')
 legend({'$\|\mathbf{Ax} - \mathbf{b}\|$','$\|\mathbf{Lx}\|$'},'Interpreter','latex');

 hold off
 figure(2)
 loglog(residlNorm,regSolNorm)
 xlabel('$\|\mathbf{Ax} - \mathbf{b}\|$','Interpreter','LaTex')
 ylabel('$\|\mathbf{Lx}\|$','Interpreter','LaTex')
 
 
 
 
 
 
 % xreg = sum fi * ((ui' b) / sigmai)* vi

 

end

