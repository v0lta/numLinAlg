%% The first example from Embree's paper on the restart GMRES.

A = [ 1 -2; 0 1]; %cone shape example from the back of the paper.
%A = [ 1 -1; 1 1]; %cone

it = 30;
r1 = zeros(2,it);
x = linspace(-10,10,500);
y = x;
%x = linspace(-7,-6,50);
%y = linspace(-9,-7,50);

r1PlainA = zeros(length(x),length(y));
r1PlainB = zeros(length(x),length(y));

for i = 1:length(x)
    for j = 1:length(y)
        r1 = [x(i); y(j)];
      
        for k=1:it
            r1 = r1 - ((r1'*A*r1) / (r1'*A'*A*r1)) * A*r1;
        end
        r1PlainA(i,j) = norm(r1)/norm([x(i); y(j)]);
        
        %[~,~,relres] = gmres(A,[x(i); y(j)],1);
        %r1PlainB(i,j) = relres;
    end
end
disp('GMRES(1) done')


%% Plotting
disp('Plotting')
tickLabels = sort([0 -5 -10 -15]);
subplot(1,2,1)
r1Plot = surf(x,y,log(r1PlainA));shading('flat');view([0,90]);colorbar;caxis([-15 0]);

subplot(1,2,2)
histogram(log(r1PlainA))

%figure(3)
%surf(log(r1PlainB));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
%figure(4)
%histogram(log(r1PlainB))