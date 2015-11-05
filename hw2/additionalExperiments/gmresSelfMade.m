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
it = 3;
xSol = A\b;

% GMRES from the saad paper.
for i = 1:it
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
    x(:,i) = x0  + Q(:,1:i)*y;
    r(:,i) = xSol - x(:,i);
    xNorm(i) = norm(xSol - x(:,i)); 
    
end

        
