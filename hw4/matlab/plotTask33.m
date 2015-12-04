%homework 4 task 2,3,4 % toeplitz and circulant matrices.

colorMat = lines;

%% test with grcar
a = 0:0.1:(2*pi+0.5);
dim = 1000;
r = [1  1  1 1  zeros(1,dim-4)];
c = [1 -1  0 0  zeros(1,dim-4)];
T0 = toeplitz(c,r);

%% Toeplitz Matrix 1.
    r = [0 0 -4 -2i zeros(1,dim-4)];
    c = [0 2i -1 2  zeros(1,dim-4)];

T1 = toeplitz(c,r);


%% Toeplitz Matrix 2 bullshead.

r = [0 0 1 7/10 zeros(1,dim-4)];
c = [0 2i 0 0   zeros(1,dim-4)];

T2 = toeplitz(c,r);


%% Toeplitz Matrix 3 triangle.

r = [0 0 1/4 0 zeros(1,dim-4)];
c = [0 1  0  0 zeros(1,dim-4)];

T3 = toeplitz(c,r);

%% Toeplitz Matrix 4 whale.

r = [0 10 3+1i    4     1i  zeros(1,dim-5)];
c = [0 1  1i    -(3+2i) -1  zeros(1,dim-5)];

T4 = toeplitz(c,r);

T = {T0 T1 T2 T3 T4};
for i = 1:5
   figure(i)
   eigs = eig(cell2mat(T(i)));
   plot(real(eigs),imag(eigs),'.')    
end