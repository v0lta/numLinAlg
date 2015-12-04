
%% Brute force the triangle example.
%use a grid.
%vecTest = [1/4 0 -lambda(i) 1];
% x = -1.5:0.1:1.5;
% y = -1:0.1:1.5;
% 
% hitGrid = zeros(length(y),length(x));
% for a = 1:length(x)
%    for b = 1:length(y)
%       vecTest = [1/4 0 -(x(a) + 1i*y(b)) 1];
%       rootTest = roots(vecTest);
%       [~,I] = sort(abs(rootTest));
%       rootTest = rootTest(I);
%       if (abs(rootTest(end)) - abs(rootTest(end-1)) < eps)
%        hitGrid(a,b) = 1;
%       end       
%    end
% end
% figure(1)
% surf(x,y,hitGrid);shading('flat')

%% go trough the eigs at 1000
dim = 2000;
r = [0 0 1/4 0 zeros(1,dim-4)];
c = [0 1  0  0 zeros(1,dim-4)];

T3 = toeplitz(c,r);
lambda = eig(T3);
lambdaHits = zeros(dim,dim);

for b = 1:500:dim
    r = [0 0 1/4 0 zeros(1,dim-4)];
    c = [0 1  0  0 zeros(1,dim-4)];
    T3 = toeplitz(c,r);
    lambda = eig(T3);
    lambdaHits(b,1:length(lambda)) = lambda;
    for a = 1:length(lambda)
      vecTest = [1/4 0 -lambdaHits(b,a) 1];
      rootTest = roots(vecTest);
      [~,I] = sort(abs(rootTest));
      rootTest = rootTest(I);
      if (abs(rootTest(end)) - abs(rootTest(end-1)) > 2*eps)
        lambdaHits(b,a) = 0;
      end       
    end
    int32(b/dim*100)
end
lambda = lambdaHits(:);
lambda(lambda==0) = [];
figure(2)
plot(real(lambda),imag(lambda),'.')
