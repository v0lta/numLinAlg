
load('reg.mat');


disp('solution using a naive approach')
x1 = A1\berr1;
x2 = A2\berr2;
x3 = A3\berr3;
x4 = A4\berr4;
x5 = A5\berr5;
x6 = A6\berr6;

it = 200;
disp('solution using cg(A, b, #iterations)')
xcg1 = cg(A1, berr1, it);
xcg2 = cg(A2, berr2, it);
xcg3 = cg(A3, berr3, it);
xcg4 = cg(A4, berr4, it);
xcg5 = cg(A5, berr5, it);
xcg6 = cg(A6, berr6, it);

x = [x1 x2 x3 x4 x5 x6];
xt = [xcg1 xcg2 xcg3 xcg4 xcg5 xcg6];
xdiff = x - xt;
norms = [norm(xdiff(:,1)) norm(xdiff(:,2)) norm(xdiff(:,3)) ...
         norm(xdiff(:,4)) norm(xdiff(:,5)) norm(xdiff(:,6))];
conds = [cond(A1) cond(A2) cond(A3) cond(A4) cond(A5) cond(A6)];
    
figure(1)
semilogy(norms)
hold on
semilogy(conds)
legend('norm naive - regularized','conditioning')
xlabel('matrix number')
hold off

figure(2)
semilogy([norm(x1) norm(x2) norm(x3) norm(x4) norm(x5) norm(x6)])
hold on
semilogy([norm(xcg1) norm(xcg2) norm(xcg3) norm(xcg4) norm(xcg5) norm(xcg6)])
title('solution norm comparison')
legend('norm(x naive)','norm(x regularized)')
hold off


