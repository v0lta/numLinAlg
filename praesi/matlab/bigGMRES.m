
load('randAbGood.mat')
%A = gallery('grcar',60);
%A = randn(60);

TOL   = 10^(-15);
MAXIT = 50;

%[Q,R] = qr(A);
%A = Q;
b = [ones(20,1); zeros(20,1); ones(20,1)];
resOld = 1;
maxIt = 50;
resIt = zeros(maxIt,1);
resCells = cell(maxIt,1);

for i = 1:1:maxIt
  [~,~,res,~,resVec] = gmres(A,b,i,TOL,MAXIT);
  if res > resOld 
      disp('jump up at:')
      disp(i)
  end
  resOld = res;
  resIt(i) = res;
  resCells{i} = resVec;
end


%% plotting stuff
figure(1)
subplot(1,2,1)
semilogy(1:maxIt,resIt)
xlabel('inner iterations')
ylabel('residual')

subplot(1,2,2)
semilogy((resCells{34}./norm(b)))
hold on
semilogy((resCells{35}./norm(b)))
xlabel('inner and outer iteratons')
ylabel('residual')
legend({'GMRES(\texttt{34})','GMRES(\texttt{35})'},'Interpreter','latex')
hold off
