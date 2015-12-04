%homework 4 task 2,3,4 % toeplitz and circulant matrices.

%test polyorder.
%plot(x,polyval([1 0 0],x))

%% test from paper;
a = 0:0.1:(2*pi+0.5);
maxDim = 100;
r = [0 1 0  zeros(1,maxDim-4)];
c = [0 0 1  zeros(1,maxDim-4)];
Tm1 = toeplitz(c,r);
symCurvem1 = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
lambda = eig(Tm1);
lambdaInf = [];

for j = 1:1:maxDim
    r = [0 1 0  zeros(1,j-4)];
    c = [0 0 1  zeros(1,j-4)];
    lambda = eig(toeplitz(c,r));

for i=1:length(lambda)
    testVec = [1 (-lambda(i)) 0 1];
    testRoots = roots(testVec); 
    [~,I] = sort(abs(testRoots));
    testRoots = testRoots(I);
    if (abs(testRoots(end)) - abs(testRoots(end-1)) < eps)
        lambdaInf = [lambdaInf lambda(i)];
    end
end
   j/maxDim*100
end

for i=1:length(a)
  symCurveVals(i)  = symCurvem1(cos(a(i)) + 1i*sin(a(i)));
end
figure
hold on
[~,I] = sort(angle(lambdaInf));
plot(real(symCurveVals),imag(symCurveVals))
%plot(real(lambda),imag(lambda),'.')
plot(real(lambdaInf(I)),imag(lambdaInf(I)),'.')
hold off



%% test with grcar
a = 0:0.1:(2*pi+0.5);
r = [1  1  1 1  zeros(1,maxDim-4)];
c = [1 -1  0 0  zeros(1,maxDim-4)];
T0 = toeplitz(c,r);
symCurve0 = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
lambda = eig(T0);
lambdaInf = [];
a = 0:0.1:(2*pi+0.5);

for i=1:length(lambda)
    testVec = [1 1 1 -1 (1-lambda(i))]; 
    testRoots = roots(testVec); 
    [~,I] = sort(real(testRoots));
    testRoots = testVec(I);
    if (abs(testRoots(end)) - abs(testRoots(end-1)) < eps)
        lambdaInf = [lambdaInf lambda(i)];
    end
end
for i=1:length(a)
  symCurveVals(i)  = symCurve0(cos(a(i)) + 1i*sin(a(i)));
end
figure
hold on
[~,I] = sort(angle(lambdaInf));
plot(real(symCurveVals),imag(symCurveVals))
plot(real(lambdaInf(I)),imag(lambdaInf(I)))
hold off

%% Toeplitz Matrix 1.
r = [0 0 -4 -2i zeros(1,maxDim-4)];
c = [0 2i -1 2  zeros(1,maxDim-4)];
T1 = toeplitz(c,r);
symCurve1 = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
lambda = eig(T1);
lambdaInf = [];
a = 0:0.1:(2*pi+0.5);

for j = 1:1:maxDim
    r = [0 0 -4 -2i zeros(1,j-4)];
    c = [0 2i -1 2  zeros(1,j-4)];
    lambda = eig(toeplitz(c,r));

for i=1:length(lambda)
    testVec = [-2i -4 +2 -1 (2-lambda(i))];
    testRoots = roots(testVec); 
    [~,I] = sort(abs(testRoots));
    testRoots = testVec(I);
    if (abs(testRoots(end)) - abs(testRoots(end-1)) < eps)
        lambdaInf = [lambdaInf lambda(i)];
    end
end
j/maxDim*100
end
for i=1:length(a)
  symCurveVals(i)  = symCurve1(cos(a(i)) + 1i*sin(a(i)));
end
figure
hold on
plot(real(symCurveVals),imag(symCurveVals))
plot(real(lambdaInf(I)),imag(lambdaInf(I)),'.')
hold off

%% Toeplitz Matrix 2 bullshead.
r = [0 0 1 7/10 zeros(1,maxDim-4)];
c = [0 2i 0 0   zeros(1,maxDim-4)];
T2 = toeplitz(c,r);
symCurve2 = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
lambda = eig(T2);
lambdaInf = [];
a = 0:0.1:(2*pi+0.5);

for i=1:length(lambda)
    [2i 0 0 1 7/10]
    testVec = [7/10 1 0 -lambda(i) 2i];
    testRoots = roots(testVec); 
    [~,I] = sort(abs(testRoots));
    testRoots = testVec(I);
    if (abs(testRoots(end)) - abs(testRoots(end-1)) < eps)
        lambdaInf = [lambdaInf lambda(i)];
    end
end
for i=1:length(a)
  symCurveVals(i)  = symCurve2(cos(a(i)) + 1i*sin(a(i)));
end
figure
hold on
plot(real(symCurveVals),imag(symCurveVals))
plot(real(lambdaInf(I)),imag(lambdaInf(I)),'.')
hold off

%% Toeplitz Matrix 3 triangle.
r = [0 0 1/4 0 zeros(1,maxDim-4)];
c = [0 1  0  0 zeros(1,maxDim-4)];
T3 = toeplitz(c,r);
symCurve3 = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
             
lambda = eig(T3);
lambdaInf = [];
a = 0:0.1:(2*pi+0.5);
for j = 1:1:maxDim
r = [0 0 1/4 0 zeros(1,j-4)];
c = [0 1  0  0 zeros(1,j-4)];
lambda = eig(toeplitz(c,r));

for i=1:length(lambda)
    testVec = [1/4 0 -lambda(i) 1];
    testRoots = roots(testVec); 
    [~,I] = sort(abs(testRoots));
    testRoots = testVec(I);
    if (abs(testRoots(end)) - abs(testRoots(end-1)) < eps)
        lambdaInf = [lambdaInf lambda(i)];
    end
end
j/maxDim*100
end

for i=1:length(a)
  symCurveVals(i)  = symCurve3(cos(a(i)) + 1i*sin(a(i)));
end
figure
plot(real(symCurveVals),imag(symCurveVals))
hold on
plot(real(lambdaInf(I)),imag(lambdaInf(I)))             
hold off        

%% Toeplitz Matrix 4 whale.
r = [0 10 3+1i    4     1i  zeros(1,maxDim-5)];
c = [0 1  1i    -(3+2i) -1  zeros(1,maxDim-5)];
T4 = toeplitz(c,r);
symCurve4 = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
