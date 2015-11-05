function [ r1Plain,r2Plain,x ] = GMRESOneTwo( A,GridPointNo )
%Returns the residual of the GMRES computations

it = 30;
r1 = zeros(3,it);
x = linspace(-10,10,GridPointNo);
y = x;
r1Plain = zeros(length(x),length(y));

for i = 1:length(x)
    for j = 1:length(y)
        r1 = [x(i); y(j); 1];
      
        for k=1:it
            r1 = r1 - ((r1'*A*r1) / (r1'*A'*A*r1)) * A*r1;
        end
        r1Plain(i,j) = norm(r1)/norm([x(i); y(j); 1]);
    end
end
disp('GMRES(1) done')


%% The second example from the same paper on restart GMRES.
r2 = zeros(3,it);
%r(k+2) = p(A)r(k). p(z) = 1 + alpha*z + beta*z^2;
r2Norms = ones(1,it);

r2Plain = ones(length(x),length(y));


for i = 1:length(x)
    for j = 1:length(y)
      r2 = [x(i); y(j); 1];
      for k=1:it
        alpha = ((r2'         * A*A * r2)  * ...
                ( r2' * A'    * A*A * r2)  - ...
                ( r2'         * A*    r2)  * ...
                ( r2' * A'*A' * A*A * r2)) / ...
               (( r2' * A'    * A   * r2)  * ...
                ( r2' * A'*A' * A*A * r2)  - ...
                ( r2' * A'    * A*A * r2)  * ...
                ( r2' * A'    * A*A * r2));
    
        beta =  ((r2' *         A   * r2)  * ...
                (r2'  * A'    * A*A * r2)  - ...
                (r2'          * A*A * r2)  * ...
                (r2'  * A'    * A   * r2)) / ...
               ((r2'  * A'    * A   * r2)  * ...
                (r2'  * A'*A' * A*A * r2)  - ...
                (r2'  * A'    * A*A * r2)  * ...
                (r2'  * A'    * A*A * r2));
      
        p = eye(3) + alpha*A + beta*(A^2);
        r2 = p*r2;
      end
      r2Plain(i,j) = norm(r2)/norm([x(i); y(j); 1]);
    end
    disp(i/length(x)*100)
end


end

