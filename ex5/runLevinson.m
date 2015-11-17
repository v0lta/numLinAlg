
%% test the Levinson alrogithm
factors = 1:0.5:5;
for f = 1:length(factors)
n = 1000*factors(f);
rho = randn(n,1);
sigma = randn(n-1,1);
T = toeplitz([rho(1); sigma],rho);
b = randn(n,1);

disp(n)
tic
[x,~] = levinson(sigma,rho,b);
time(f) = toc;
tic;
xB = T\b;
time2(f) = toc;

end

figure(1)
loglog(factors*1000,time)
hold on
loglog(factors*1000,time2)
legend('levinson','matlab')
hold off