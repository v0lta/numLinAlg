clear all
%% The first example from Embree's paper on the restart GMRES.
disp('GMRES(1)')
A = [ 1 1 1; 0 1 3; 0 0 1];
b = [2 -4 1]';

it = 30;
r1 = zeros(3,it);
r1(:,1) = b;
r1Norms = zeros(1,it);
r1Norms(1) = norm(r1(:,1))/norm(b);


for k=1:it
    r1(:,k+1) = r1(:,k) - ((r1(:,k)'*A*r1(:,k)) / (r1(:,k)'*A'*A*r1(:,k))) ...
         * A*r1(:,k);
    r1Norms(k+1) = norm(r1(:,k+1))/norm(b);
end
r1Norms(4:end) = eps;


%% The second example from the same paper on restart GMRES.
disp('GMRES(2)')
r2 = zeros(3,it);
%r(k+2) = p(A)r(k). p(z) = 1 + alpha*z + beta*z^2;
r2(:,1) = b;
r2(:,2) = [3 -3 0];
r2Norms = zeros(1,it);
r2Norms(1) = norm(r2(:,1))/norm(b);

for k=1:it
    alpha = ((r2(:,k)'         * A*A * r2(:,k))  * ...
             (r2(:,k)' * A'    * A*A * r2(:,k))  - ...
             (r2(:,k)'         * A*    r2(:,k))  * ...
             (r2(:,k)' * A'*A' * A*A * r2(:,k))) / ...
            ((r2(:,k)' * A'    * A   * r2(:,k))  * ...
             (r2(:,k)' * A'*A' * A*A * r2(:,k))  - ...
             (r2(:,k)' * A'    * A*A * r2(:,k))  * ...
             (r2(:,k)' * A'    * A*A * r2(:,k)));
    
   beta =  ((r2(:,k)'  *         A   * r2(:,k))  * ...
            (r2(:,k)'  * A'    * A*A * r2(:,k))  - ...
            (r2(:,k)'          * A*A * r2(:,k))  * ...
            (r2(:,k)'  * A'    * A   * r2(:,k))) / ...
           ((r2(:,k)'  * A'    * A   * r2(:,k))  * ...
            (r2(:,k)'  * A'*A' * A*A * r2(:,k))  - ...
            (r2(:,k)'  * A'    * A*A * r2(:,k))  * ...
            (r2(:,k)'  * A'    * A*A * r2(:,k)));
      
   p = eye(3) + alpha*A + beta*(A^2);
   r2(:,k+1) = p*r2(:,k);
   r2Norms(k+1) = norm(r2(:,k+1))/norm(b);   
end

semilogy(1:(it+1),r1Norms)
hold on
semilogy(1:(it+1),r2Norms)
legend('GMRES(1)','GMRES(2)')




