%% plotting
wait(job1)
sigmin1 = cell2mat(fetchOutputs(job1));
fig1 = figure(1);
v = [-0.005 0.1 0.25 0.5  1 2 4 6 8 9.5];
%v = [0.1 0.5 2 4];
[c,h] = contour(x,y,-log10(sigmin1),v);
hold on
eigs = eig(A);
plot(real(eigs),imag(eigs),'.')
colormap(fig1,parula)
%clabel(c,h)
hold off

%% make plot with imaginary noise
colorMat = lines;
figure(2)
v = [2];
contour(x,y,-log10(sigmin1),[v v]);
hold on;
for k=1:100
         Err = randn(dim)+1i*randn(dim); 
	     Err = Err*(10^(-v))/norm(Err); %*rand();
         ew = eig(A+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
end
hold off;

%% plot with real noise.
figure(3)
v = [2];
contour(x,y,-log10(sigmin1),[v v]);
hold on;
for k=1:100
         Err = randn(dim); %+1i*randn(dim); 
	     Err = Err*(10^(-v))/norm(Err); %*rand();
         ew = eig(A+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
         hold on;
end
hold off