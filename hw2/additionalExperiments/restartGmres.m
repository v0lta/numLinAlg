clear all;



%% arnoldi iteration implementation. (compute eigenvalues)
nEnd = 3;
A = [ 1 1 1; 
      0 1 3;
      0 0 1];
b = [2 -4 1]';

x0 = zeros(3,1);
r0 = b - A*x0;
Q(:,1) = r0/(norm(r0));
it = 30;
m = 1;
xSol = A\b;

% restart GMRES(m) from the SAAD paper.

for k = 1:it
  for i = 1:m
    v = A*Q(:,i);
    for j = 1:i
        H(j,i) = Q(:,j)'*v;
        v = v - H(j,i)*Q(:,j);
    end
    
    H(i+1,i) = norm(v);
    Q(:,i+1) = v/H(i+1,i);
    
    %compute A...
    %Q*H*Q(:,1:i)'
    
    %approximate solution
    y = (Q*H)\b;
    x(:,i,k) = x0 + Q(:,1:i)*y;
    r(:,i,k) = xSol - x(:,i);
    xNorm(i,k) = norm(xSol - x(:,i));  
  end
  %restart
  x0 = x(:,m,k);
  r0 = b - A*x0;
  if (norm(r0) < 100*eps)
      disp('convergence')
      break
  end
  Q = [];
  H = [];
  Q(:,1) = r0/(norm(r0));
  
end
