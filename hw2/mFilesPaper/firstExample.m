clear all

%% The first example from Embree's paper on the restart GMRES.
disp('GMRES(1)')
A = [ 1 1 1; 0 1 3; 0 0 1];
b = [2 -4 1]';

it = 3;
r1 = zeros(3,it);
r1(:,1) = b;

for k=1:it
    r1(:,k+1) = r1(:,k) - ((r1(:,k)'*A*r1(:,k)) / (r1(:,k)'*A'*A*r1(:,k))) ...
         * A*r1(:,k);
end

disp('results just like its in the paper:')
disp(r1)
disp(' ')

