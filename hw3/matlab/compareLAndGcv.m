%% obtain lambdas
plotGCV
useTikhonov
close all


%% plot them.
plot(lambdasLcurv,'*')
semilogy(lambdasLcurv,'o')
hold on
semilogy(lambda,'*')
legend('L-curve','GCV')
xlabel('problem no.')
ylabel('$\lambda$','Interpreter','latex')