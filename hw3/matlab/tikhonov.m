function [ xReg ] = tikhonov( A,b,ignorePct,plotting )
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
 if (nargin < 4)
     disp('No plotting parameters set assuming plots are desired')
     plotting = true;
 end
 if (nargin < 3)
     disp('No filter parameter spefified using 15%');
     ignorePct = 15;
 end
 
 
 
 %% compute svd
 [U,S,V] = svd(A);
  
 %% construct the L1 curve.
 sigIgnore = n/100*ignorePct;
 %chose appropriate range ignoring the smallest sigIgnore%.
 lambda = logspace(log10(S((end-sigIgnore), ...
          (end-sigIgnore))),log10(S(1,1)),n);
 
 %find the L1 curve
 %plot norm(L*x_reg) against norm(A*x - b)
 L = eye(size(A));
 regSolNorm = zeros(n,1);
 residlNorm = zeros(n,1);
 xVec = zeros(n,n);
 
 
 for k = 1:n
%      for i = 1:n
%         f = S(i,i)^2 / (S(i,i)^2 + lambda(k)^2); 
%         x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
%      end
     sigma = diag(S);
     fVec = sigma.^2 ./ ( sigma.^2 + ones(n,1)*lambda(k).^2);
     x =  sum(V*(diag(U'*b .* sigma.^(-1)))*diag(fVec),2);
     regSolNorm(k) = norm(L*x);
     residlNorm(k) = norm(A*x - b);
     xVec(:,k) = x;
 end
 
 

 %% pick the best lambda from the L-curve data.
 % compute the curvature of the l-curve. 
 rhoHat = log(residlNorm);
 etaHat = log(regSolNorm);
 rhoHatPrime = zeros(1,(n-1));
 etaHatPrime = zeros(1,(n-1));
 rhoHatDoublePrime = zeros(1,(n-2));
 etaHatDoublePrime = zeros(1,(n-2));
 % compute derivatives with respect to lambda.
 %d rhoHat/ d lambda
 for k = 1:(n-1)
  rhoHatPrime(k) = (rhoHat(k+1) - rhoHat(k))/(lambda(k+1) - lambda(k));
  etaHatPrime(k) = (etaHat(k+1) - etaHat(k))/(lambda(k+1) - lambda(k));
 end
 for k = 1:(n-2)
  rhoHatDoublePrime(k) = (rhoHatPrime(k+1) - rhoHatPrime(k))/(lambda(k+1) - lambda(k));
  etaHatDoublePrime(k) = (etaHatPrime(k+1) - etaHatPrime(k))/(lambda(k+1) - lambda(k));
 end
 % use the derivatives to find the curvature.
 kappa = 2 *  ( rhoHatPrime(1:end-1).*etaHatDoublePrime  -  ...
                etaHatPrime(1:end-1).*rhoHatDoublePrime )./ ...
             (( rhoHatPrime(1:end-1).^2 + etaHatPrime(1:end-1).^2).^(3/2));
 [Y,I] = max(kappa);
 
 if (plotting == true)
    %% plot the L-curve.
    figure(1)
    loglog(lambda,residlNorm)
    hold on
    loglog(lambda,regSolNorm)
    loglog(lambda(I),regSolNorm(I),'*')
    loglog(lambda(I),residlNorm(I),'*')
    xlabel('$\lambda$','Interpreter','latex')
    legend({'$\|\mathbf{Ax} - \mathbf{b}\|$','$\|\mathbf{Lx}\|$'}, ...
         'Interpreter','latex');
    hold off
    figure(2)
    loglog(residlNorm,regSolNorm)
    hold on;
    loglog(residlNorm(I),regSolNorm(I),'*')
    xlabel('$\|\mathbf{Ax} - \mathbf{b}\|$','Interpreter','LaTex')
    ylabel('$\|\mathbf{Lx}\|$','Interpreter','LaTex')
    hold off; 
 
    figure(3)
    plot(log(lambda(1:end-2)),kappa)
    hold on;
    plot(log(lambda(I)),Y,'*')
    ylabel('curvature $\kappa$','Interpreter','latex');
    xlabel('$\lambda$','Interpreter','latex');
    hold off;
 end

 xReg = xVec(:,I);

end

