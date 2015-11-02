clear all
%% The first example from Embree's paper on the restart GMRES.
disp('GMRES(1)')
A = [ 1 1 1; 0 1 3; 0 0 1];
b = [2 -4 1]';

it = 30;
r1 = zeros(3,it);
x = linspace(-10,10,100);
y = x;
r1Plain = zeros(length(x),length(y));

for i = 1:length(x)
    for j = 1:length(y)
        r1 = [x(i); y(j); 1];
      
        for k=1:it
            r1 = r1 - ((r1'*A*r1) / (r1'*A'*A*r1)) * A*r1;
        end
        r1Plain(i,j) = norm(r1)/norm(b);
    end
end



%% The second example from the same paper on restart GMRES.
disp('GMRES(2)')
r2 = zeros(3,it);
%r(k+2) = p(A)r(k). p(z) = 1 + alpha*z + beta*z^2;
r2Norms = ones(1,it);
r2Norms(1) = norm(r2(:,1))/norm(b);


r2Plain = ones(length(x),length(y));


for i = 1:length(x)
    for j = 1:length(y)
      r2 = [x(i); y(j); 1];
      for k=1:it/2
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
      r2Plain(i,j) = norm(r2)/norm(b);
    end
end

%% Plotting
tickLabels = sort([10^0 10^-5 10^-10 10^-15]);
figure(1)
surf(log(r1Plain));shading('flat');view([0,90]);colorbar('Ticks',log(tickLabels));
figure(2)
surf(log(r2Plain));shading('flat');view([0,90]);colorbar('Ticks',log(tickLabels));


