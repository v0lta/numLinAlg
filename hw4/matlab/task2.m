%homework 4 task 2,3,4 toeplitz and circulant matrices.

%0 test with grcar
dim = 150;
r = [1  1  1 1  zeros(1,dim-4)];
c = [1 -1  0 0  zeros(1,dim-4)];
T0 = toeplitz(c,r);


%% Toeplitz Matrix 1.
a = 0:0.1:(2*pi+0.5);
dim = 150;

    r = [0 0 -4 -2i zeros(1,dim-4)];
    c = [0 2i -1 2  zeros(1,dim-4)];

T1 = toeplitz(c,r);
figure(1)
eigs = eig(T1);
plot(real(eigs),imag(eigs),'.')
title('lambda T1')

symCurve = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);

symCurveVals = zeros(1,length(a));
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
figure
plot(real(symCurveVals),imag(symCurveVals))
hold on

%create circulant matrix
v = [r(1:4) zeros(1,dim - 7) flip(c(2:4))];
circ1 = toeplitz([v(1) fliplr(v(2:end))], v);
eigs = eig(circ1);
plot(real(eigs),imag(eigs),'.')
  
%% Toeplitz Matrix 2 bullshead.

r = [0 0 1 7/10 zeros(1,dim-4)];
c = [0 2i 0 0   zeros(1,dim-4)];

T2 = toeplitz(c,r);
figure
eigs = eig(T2);
plot(real(eigs),imag(eigs),'.')
title('Bulls head')

symCurve = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
figure
plot(real(symCurveVals),imag(symCurveVals))
hold on
%create circulant matrix
v = [r(1:4) zeros(1,dim - 7) flip(c(2:4))];
circ1 = toeplitz([v(1) fliplr(v(2:end))], v);
eigs = eig(circ1);
plot(real(eigs),imag(eigs),'.')

%% Toeplitz Matrix 3 triangle.

r = [0 0 1/4 0 zeros(1,dim-4)];
c = [0 1  0  0 zeros(1,dim-4)];

T3 = toeplitz(c,r);
figure
eigs = eig(T3);
plot(real(eigs),imag(eigs),'.')
title('triangle')

symCurve = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
figure
plot(real(symCurveVals),imag(symCurveVals))
hold on
%create circulant matrix
v = [r(1:4) zeros(1,dim - 7) flip(c(2:4))];
circ1 = toeplitz([v(1) fliplr(v(2:end))], v);
eigs = eig(circ1);
plot(real(eigs),imag(eigs),'.')

%% Toeplitz Matrix 4 whale.

r = [0 10 3+1i    4     1i  zeros(1,dim-5)];
c = [0 1  1i    -(3+2i) -1  zeros(1,dim-5)];

T4 = toeplitz(c,r);
figure
eigs = eig(T4);
plot(real(eigs),imag(eigs),'.')
title('whale')

symCurve = @(z) c(5)*z.^(-4) + c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3) + r(5)*z.^(4) ;
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
figure
plot(real(symCurveVals),imag(symCurveVals))
hold on
%create circulant matrix
v = [r(1:5) zeros(1,dim - 7) flip(c(2:5))];
circ1 = toeplitz([v(1) fliplr(v(2:end))], v);
eigs = eig(circ1);
plot(real(eigs),imag(eigs),'.')

