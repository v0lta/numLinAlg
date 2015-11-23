dim = 64;
A = gallery('grcar',dim);

addpath('eigtoollib/')
eigtool(A);

%% plot perts
hold on;
for k=1:100
         Err = randn(dim)+1i*randn(dim); 
	     Err = Err*(10^(-1))/norm(Err); %*rand();
         ew = eig(A+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
end