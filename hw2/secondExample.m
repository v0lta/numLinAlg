%% The second example from the same paper on restart GMRES.
disp('GMRES(2)')

%r(k+2) = p(A)r(k). p(z) = 1 + alpha*z + beta*z^2;
r2(:,1) = b;
%r2(:,1) = [3 -3 0];

for k=1:1
   alpha = ((r2(:,k)'*A*A*r2(:,k)) * (r2(:,k)'*A'*A*A*r2(:,k)) - (r2(:,k)'*A*r2(:,k)) * (r2(:,k)'*A'*A'*A*A*r2(:,k))) ...
          /((r2(:,k)'*A'*A*r2(:,k)) * (r2(:,k)'*A'*A'*A*A*r2(:,k)) - (r2(:,k)'*A'*A*A*r2(:,k)) * (r2(:,k)'*A'*A*A*r2(:,k)));
    
   beta = ((r2(:,k)'*A*r2(:,k)) * (r2(:,k)'*A'*A*A*r2(:,k)) - (r2(:,k)'*A*A*r2(:,k))* (r2(:,k)'*A'*A*r2(:,k))) ...
          /((r2(:,k)'*A'*A*r2(:,k)) * (r2(:,k)'*A'*A'*A*A*r2(:,k)) - (r2(:,k)'*A'*A*A*r2(:,k)) * (r2(:,k)'*A'*A*A*r2(:,k)));
      
   p = 1 + alpha*A + beta*(A^2);
   p2 = eye(3) + alpha*A + beta*A'*A;
   p3 = eye(3) + alpha*A + beta*A*A';
   p4 = eye(3) + alpha*A + beta*A.^2;
   p9 = eye(3) + alpha*A + beta*A.^2;
  
   r2(:,k+1) = p*r2(:,k)
   r2(:,k+1) = p2*r2(:,k)
   r2(:,k+1) = p3*r2(:,k)
   r2(:,k+1) = p4*r2(:,k)
   r2(:,k+1) = p9*r2(:,k)    
end

disp(r2)
