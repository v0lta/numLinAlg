function [x,gamma] = levinson(sigma,rho,b)
% a version of the levinson algorithm.

n = length(rho);
gamma = rho(1);
eta = -rho(2)/gamma;
phi = -sigma(1)/gamma;

x = zeros(n,1);
y = zeros(n,1);
z = zeros(n,1);

x(1) = b(1)/gamma;
y(1) = eta;
z(1) = phi;

for k = 1:(n-1)
   
    gamma = (1 - eta*phi) * gamma;
    alpha = (b(k+1) - flip(sigma(1:k)')*x(1:k)  ) / gamma;
    x(1:k+1) = [x(1:k); 0] + [flip(y(1:k)); 1]*alpha;
    if (k == (n-1))
        break;
    end
    eta = (-rho(k+2) - flip(rho(2:(k+1))') * y(1:k)) / gamma;
    phi = (-sigma(k+1) - flip(sigma(1:k)') * z(1:k)) / gamma;
    
    yOld = y(1:k);
    y(1:k+1) = [y(1:k); 0] + [flip(z(1:k)); 1]*eta;
    z(1:k+1) = [z(1:k); 0] + [flip(yOld(1:k)); 1]*phi;
end



end
