%% The first example from Embree's paper on the restart GMRES.

A = [ 1 -2; 0 1]; %cone shape example from the back of the paper.
%A = [ 1 -1; 1 1]; %cone

it = 30;
r1 = zeros(2,it);

x = linspace(-10,10,500);
y = x;
%x = linspace(-8,-6,500);
%y = linspace(-9.5,-8,500);
r1Plain = zeros(length(x),length(y));

for i = 1:length(x)
    for j = 1:length(y)
        r1 = [x(i); y(j)];
      
        for k=1:it
            r1 = r1 - ((r1'*A*r1) / (r1'*A'*A*r1)) * A*r1;
        end
        r1Plain(i,j) = norm(r1)/norm([x(i); y(j)]);
    end
end
disp('GMRES(1) done')


%% The second example from the same paper on restart GMRES.
%r2 = zeros(2,it);
%r(k+2) = p(A)r(k). p(z) = 1 + alpha*z + beta*z^2;
%r2Norms = ones(1,it);
%r2Norms(1) = norm(r2(:,1))/norm([x(i); y(j)]);

% x2 = linspace(-10,10,50);
% y2 = x2;
% r2Plain = ones(length(x2),length(y2));
% 
% for i = 1:length(x2)
%     for j = 1:length(y2)
%       r2 = [x(i); y(j)];
%       for k=1:it
%         alpha = ((r2'         * A*A * r2)  * ...
%                 ( r2' * A'    * A*A * r2)  - ...
%                 ( r2'         * A*    r2)  * ...
%                 ( r2' * A'*A' * A*A * r2)) / ...
%                (( r2' * A'    * A   * r2)  * ...
%                 ( r2' * A'*A' * A*A * r2)  - ...
%                 ( r2' * A'    * A*A * r2)  * ...
%                 ( r2' * A'    * A*A * r2));
%     
%         beta =  ((r2' *         A   * r2)  * ...
%                 (r2'  * A'    * A*A * r2)  - ...
%                 (r2'          * A*A * r2)  * ...
%                 (r2'  * A'    * A   * r2)) / ...
%                ((r2'  * A'    * A   * r2)  * ...
%                 (r2'  * A'*A' * A*A * r2)  - ...
%                 (r2'  * A'    * A*A * r2)  * ...
%                 (r2'  * A'    * A*A * r2));
%       
%         p = eye(2) + alpha*A + beta*(A^2);
%         r2 = p*r2;
%       end
%       r2Plain(i,j) = norm(r2)/norm([x(i); y(j)]);
%     end
%     disp(i/length(x)*100)
% end
% disp('GMRES(2) done')

%% Plotting
disp('Plotting')
tickLabels = sort([0 -5 -10 -15]);
figure(1)
r1Plot = surf(x,y,log(r1Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
%figure(2)
%r2Plot = surf(x2,y2,log(r2Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);


