a = 0:0.1:(2*pi+0.5);

%%  frog
t = [2 -1 2i 0 0 -4 -2i];
diagPos = 4;

r = [0 0 -4 -2i zeros(1,dim-4)];
c = [0 2i -1 2  zeros(1,dim-4)];

T1 = toeplitz(c,r);
figure(1)
symCurve = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);

symCurveVals = zeros(1,length(a));
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
hold on
plot(real(symCurveVals),imag(symCurveVals))
c = flip(t(1:diagPos));
r = t(diagPos:end);
[teig,spsi,sakap] = toeasy(c,r,1000);
plot(real(teig),imag(teig),'.','color',colorMat(3,:))
title('frog')
hold off


%% bullshead
t = [2i 0 0 1 7/10];
diagPos = 2;

r = [0 0 1 7/10 zeros(1,dim-4)];
c = [0 2i 0 0   zeros(1,dim-4)];

T2 = toeplitz(c,r);
figure(2)


symCurve = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
hold on
plot(real(symCurveVals),imag(symCurveVals))
c = flip(t(1:diagPos));
r = t(diagPos:end);
[teig,spsi,sakap] = toeasy(c,r,1000);
plot(real(teig),imag(teig),'.','color',colorMat(3,:))
title('bullshead')
hold off


%% triangle
t = [1 0 0 1/4];
diagPos = 3;
r = [0 0 1/4 0 zeros(1,dim-4)];
c = [0 1  0  0 zeros(1,dim-4)];

T3 = toeplitz(c,r);
figure(3)
%eigs = eig(T3);
%plot(real(eigs),imag(eigs),'.')
title('triangle')

symCurve = @(z) c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3);
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
hold on
plot(real(symCurveVals),imag(symCurveVals))
title('triangle')
c = flip(t(1:diagPos));
r = t(diagPos:end);
[teig,spsi,sakap] = toeasy(c,r,1000);
plot(real(teig),imag(teig),'.','color',colorMat(3,:))
title('triangle')
hold off


%% whale
r = [0 10 3+1i    4     1i  zeros(1,dim-5)];
c = [0 1  1i    -(3+2i) -1  zeros(1,dim-5)];

T4 = toeplitz(c,r);
figure(4)
%eigs = eig(T4);
%plot(real(eigs),imag(eigs),'.')

symCurve = @(z) c(5)*z.^(-4) + c(4)*z.^(-3) + c(3)*z.^(-2) + c(2)*z.^(-1) + c(1)*z.^(0) ...
                 +r(2)*z.^(1) + +r(3)*z.^(2) + r(4)*z.^(3) + r(5)*z.^(4) ;
for i=1:length(a)
  symCurveVals(i) = symCurve(cos(a(i)) + 1i*sin(a(i)));
end
hold on
plot(real(symCurveVals),imag(symCurveVals))

t = [-1 -(3+2i) 1i 1 0 10 (3+1i) 4 1i];
diagPos = 5;

c = flip(t(1:diagPos));
r = t(diagPos:end);
[teig,spsi,sakap] = toeasy(c,r,1000);
plot(real(teig),imag(teig),'.','color',colorMat(3,:))
title('whale')
hold off




