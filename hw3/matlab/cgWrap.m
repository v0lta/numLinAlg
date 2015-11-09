function [ xReg ] = cgWrap( A,b )
% compute x from a n by n matrix A and a n by 1 vactor b. Using the con-
% jugate gradient method. 
% A n by n intput matrix
% b n by 1 right hand side

 s = size(A);
 if (s(1)  ~=  s(2))
     warning('input assumed to be square')
 end
 n = s(1);
 
 xVec = zeros(n,n);
 plotting = true;
 maxIt = 100;
 regSolNorm = zeros(maxIt,1);
 residlNorm = zeros(maxIt,1);
 lambda = 1:maxIt;
  L = eye(size(A));

 for it = 1:maxIt
     x = cg(A,b,it);
     regSolNorm(it) = norm(L*x);
     residlNorm(it) = norm(A*x - b);
     xVec(:,it) = x;
 end

 %% pick the best lambda from the L-curve data.
 % compute the curvature of the l-curve. 
 rhoHat = log(residlNorm);
 etaHat = log(regSolNorm);
 rhoHatPrime = zeros(1,(maxIt-1));
 etaHatPrime = zeros(1,(maxIt-1));
 rhoHatDoublePrime = zeros(1,(maxIt-2));
 etaHatDoublePrime = zeros(1,(maxIt-2));
 % compute derivatives with respect to lambda.
 %d rhoHat/ d lambda
 for k = 1:(maxIt-1)
  rhoHatPrime(k) = (rhoHat(k+1) - rhoHat(k))/(lambda(k+1) - lambda(k));
  etaHatPrime(k) = (etaHat(k+1) - etaHat(k))/(lambda(k+1) - lambda(k));
 end
 for k = 1:(maxIt-2)
  rhoHatDoublePrime(k) = (rhoHatPrime(k+1) - rhoHatPrime(k))/(lambda(k+1) - lambda(k));
  etaHatDoublePrime(k) = (etaHatPrime(k+1) - etaHatPrime(k))/(lambda(k+1) - lambda(k));
 end
 % use the derivatives to find the curvature.
 kappa = 2 *  ( rhoHatPrime(1:end-1).*etaHatDoublePrime  -  ...
                etaHatPrime(1:end-1).*rhoHatDoublePrime )./ ...
             (( rhoHatPrime(1:end-1).^2 + etaHatPrime(1:end-1).^2).^(3/2));
 [Y,I] = min(rhoHat);
 
 if (plotting == true)
    %% plot the L-curve.
    figure(1)
    loglog(lambda,residlNorm)
    hold on
    loglog(lambda,regSolNorm)
    loglog(lambda(I),residlNorm(I),'*')
    loglog(lambda(I),regSolNorm(I),'*')
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
    plot(log(lambda(I)),kappa(I),'*')
    ylabel('curvature $\kappa$','Interpreter','latex');
    xlabel('$\lambda$','Interpreter','latex');
    hold off;
 end
 xReg = xVec(:,I);
