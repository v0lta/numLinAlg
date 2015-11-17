function [ xReg,itNo ] = cg( A,b,it,plotting)
% [ xReg,itNo ] = cg( A,b,plotting)
% compute x from a n by n matrix A and a n by 1 vactor b. Using the con-
% jugate gradient method. 
% A n by n intput matrix
% b n by 1 right hand side
% it max no. of desired iterations.
% plotting logical true if plots are desired.

if (nargin < 3)
    disp('using defaults length(b) iterations and plotting.');
    it = length(b);
    plotting = true;
end

xVec = zeros(length(b),it);
solNormVec = zeros(1,it);
resNormVec = zeros(1,it);



r = A'*b;
p = r;
x = 0*p;
rsOld = r'*r;
for n = 1:it
    Asp = A'*(A*p);            %form A'*A without computing A'*A.
    alpha = rsOld/(p'*Asp);    % step length.
    x = x + alpha*p;           % approximate solution.
    %x = x/norm(x);
    r = r - alpha*Asp;         % residual
    rsNew = r'*r;
    beta = (rsNew)/(rsOld);    % improvement of previous step.
    p = r + beta*p;            % search direction.
    
    rsOld = rsNew;             % squared residual update.
    
    xVec(:,n) = x;                %store the solution
    resNormVec(n) = norm(A*x-b);  %compute residual norm.
    solNormVec(n) = norm(x);    %compute the solution norm.
end

 %% pick the best #iterations from the L-curve data.
 % compute the curvature of the l-curve. 
 
 lambda = 1:it;
 rhoHat = log(resNormVec);
 etaHat = log(solNormVec);
 filtParam = 25; 
 rhoHat = filtfilt(ones(1,filtParam)/filtParam, 1, rhoHat);
 etaHat = filtfilt(ones(1,filtParam)/filtParam, 1, etaHat); %remove the kinky edges
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
 rhoHatPrime = filtfilt(ones(1,filtParam)/filtParam, 1, rhoHatPrime);
 etaHatPrime = filtfilt(ones(1,filtParam)/filtParam, 1, etaHatPrime);
 for k = 1:(n-2)
  rhoHatDoublePrime(k) = (rhoHatPrime(k+1) - rhoHatPrime(k))/(lambda(k+1) - lambda(k));
  etaHatDoublePrime(k) = (etaHatPrime(k+1) - etaHatPrime(k))/(lambda(k+1) - lambda(k));
 end
 % use the derivatives to find the curvature.
 kappa = 2 *  ( rhoHatPrime(1:end-1).*etaHatDoublePrime  -  ...
                etaHatPrime(1:end-1).*rhoHatDoublePrime )./ ...
             (( rhoHatPrime(1:end-1).^2 + etaHatPrime(1:end-1).^2).^(3/2));
 [Y,I] = max(abs(kappa));
 
 if (plotting == true)
    %% plot the L-curve.
    figure(1)
    loglog(lambda, resNormVec)
    hold on
    loglog(lambda, solNormVec)
    loglog(lambda, exp(etaHat))
    loglog(lambda, exp(rhoHat))
    loglog(lambda(I),solNormVec(I),'*')
    loglog(lambda(I),resNormVec(I),'*')
    loglog(lambda(I),exp(etaHat(I)),'*')
    loglog(lambda(I),exp(rhoHat(I)),'*')
    xlabel('$\lambda$','Interpreter','latex')
    legend({'$\|\mathbf{Ax} - \mathbf{b}\|$','$\|\mathbf{Lx}\|$'}, ...
         'Interpreter','latex');
    hold off
    figure(2)
    loglog(resNormVec,solNormVec)
    hold on;
    loglog(resNormVec((I)),solNormVec((I)),'*')
    xlabel('$\|\mathbf{Ax} - \mathbf{b}\|$','Interpreter','LaTex')
    ylabel('$\|\mathbf{Lx}\|$','Interpreter','LaTex')
    hold off;
    
    figure(3)
    loglog(exp(etaHat),exp(rhoHat))
    hold on;
    loglog(exp(etaHat(I)),exp(rhoHat(I)),'*')
    hold off; 
 
    figure(4)
    plot(log(lambda(1:end-2)),abs(kappa))
    hold on;
    plot(log(lambda(I)),Y,'*')
    ylabel('curvature $\kappa$','Interpreter','latex');
    xlabel('$\lambda$','Interpreter','latex');
    hold off;
 end

 xReg = xVec(:,I);
 itNo= lambda(I);




%xReg = x(I);
