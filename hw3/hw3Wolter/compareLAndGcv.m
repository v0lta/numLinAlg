%% obtain lambdas
plotGCV
useTikhonov
close all


%% plot them.
semilogy(lambdasLcurv,'o')
hold on
semilogy(lambdasGCV,'*')
legend('L-curve','GCV')
xlabel('problem no.')
ylabel('$\lambda$','Interpreter','latex')