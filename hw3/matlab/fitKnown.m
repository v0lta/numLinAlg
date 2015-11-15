close all;clear all;clc;

%% generate values  
b = [0 0.5 1 0.75 1.5 2 0]';
pointNo = 7;
axis = linspace(0,1,pointNo);
A = zeros(pointNo,length(b));
for i=1:length(b)
   A(:,i) = axis.^(i-1);    
end
x7 = A\b;

pointNo = 300;
A = zeros(pointNo,length(b));
axis = linspace(0,1,pointNo);
for i=1:length(b)
   A(:,i) = axis.^(i-1);    
end

figure(1)
hold on;
plot(axis,A*x7)
bTrue = A*x7;
alpha = 0.5;
b = bTrue + alpha * randn(size(bTrue));
plot(axis,b);

for i=1:pointNo
   A(:,i) = axis.^(i-1);    
end


%% regularize to obtain the noise free solution again.
 [U,S,V] = svd(A);
 sigma = diag(S);
 s = size(A);
 n = s(1);
% comp xOverfit 
lambda = 10e-25;
x = zeros(n,1);
for i = 1:n
    f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
    x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
end
xOff = x;

%comp optimal fit.
%xOpt = tikhonov(A,b,15,false);
lambda = 0.079;
x = zeros(n,1);
for i = 1:n
    f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
    x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
end
xOpt = x;

%comp overdamped solution.
lambda = 3;
x = zeros(n,1);
for i = 1:n
    f = S(i,i)^2 / (S(i,i)^2 + lambda^2); 
    x = x + f*((U(:,i)'*b)/S(i,i)) * V(:,i);   
end
xDmpd = x;

hold on;
plot(axis,A*xOff);
plot(axis,A*xOpt);
plot(axis,A*xDmpd);
hold off;


%% plot for report
close all
figure(5)
subplot(1,2,1)
plot(axis,bTrue)
hold on
plot(axis,b)
hold off
subplot(1,2,2)
plot(axis,A*xOff)
hold on;
plot(axis,A*xOpt);
plot(axis,A*xDmpd);
hold off;






