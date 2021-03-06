
load('reg.mat');

%% computations
disp('solution using a naive approach')
x1 = A1\berr1;
x2 = A2\berr2;
x3 = A3\berr3;
x4 = A4\berr4;
x5 = A5\berr5;
x6 = A6\berr6;


disp('solution using tikhonov(A, b, 15, false)')
[xt1, l1] = tikhonov(A1, berr1, 15, false);
[xt2, l2] = tikhonov(A2, berr2, 15, false);
[xt3, l3] = tikhonov(A3, berr3, 15, false);
[xt4, l4] = tikhonov(A4, berr4, 15, false);
[xt5, l5] = tikhonov(A5, berr5, 15, false);
[xt6, l6] = tikhonov(A6, berr6, 15, false);

x = [x1 x2 x3 x4 x5 x6];
xt = [xt1 xt2 xt3 xt4 xt5 xt6];
xdiff = x - xt;
norms = [norm(xdiff(:,1)) norm(xdiff(:,2)) norm(xdiff(:,3)) ...
         norm(xdiff(:,4)) norm(xdiff(:,5)) norm(xdiff(:,6))];
conds = [cond(A1) cond(A2) cond(A3) cond(A4) cond(A5) cond(A6)];
lambdasLcurv = [l1 l2 l3 l4 l5 l6];

%% plotting part
figure(1)
semilogy(norms)
hold on
semilogy(conds)
legend('norm(naive - regularized)','conditioning')
xlabel('matrix number')
title('conditioning and solution norms');
hold off

figure(2)
semilogy([norm(x1) norm(x2) norm(x3) norm(x4) norm(x5) norm(x6)])
hold on
semilogy([norm(xt1) norm(xt2) norm(xt3) norm(xt4) norm(xt5) norm(xt6)])
title('solution norm comparison')
legend('norm(x naive)','norm(x regularized)')
hold off
