
%plot the pseudospectra from earliear

%% job 2
sigmin0 = cell2mat(fetchOutputs(job2));
fig1 = figure(1);
v = [2];
contour(x0,y0,-log10(sigmin0),[v v]);
hold on;
for k=1:50
         Err = randn(dim)+1i*randn(dim); 
	     Err = Err*(10^(-v))/norm(Err); %*rand();
         ew = eig(T0+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
end
hold off;


%% job 3
sigmin1 = cell2mat(fetchOutputs(job3));
v = [2];
figure
contour(x1,y1,-log10(sigmin1),[v v]);
hold on;
for k=1:50
         Err = randn(dim)+1i*randn(dim); 
	     Err = Err*(10^(-v))/norm(Err); %*rand();
         ew = eig(T1+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
end
hold off;

%% job 4
sigmin2 = cell2mat(fetchOutputs(job4));
v = [2];
figure
contour(x2,y2,-log10(sigmin2),[v v]);
hold on;
for k=1:50
         Err = randn(dim)+1i*randn(dim); 
	     Err = Err*(10^(-v))/norm(Err); %*rand();
         ew = eig(T2+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
end
hold off;


%% job 5
sigmin3 = cell2mat(fetchOutputs(job5));
v = [2];
figure
contour(x3,y3,-log10(sigmin3),[v v]);
hold on;
for k=1:50
         Err = randn(dim)+1i*randn(dim); 
	     Err = Err*(10^(-v))/norm(Err); %*rand();
         ew = eig(T3+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
end
hold off;


%% job 6
sigmin4 = cell2mat(fetchOutputs(job6));
v = [2];
figure
contour(x4,y4,-log10(sigmin4),[v v]);
hold on;
for k=1:50
         Err = randn(dim)+1i*randn(dim); 
	     Err = Err*(10^(-v))/norm(Err); %*rand();
         ew = eig(T4+Err);
	     plot(real(ew),imag(ew),'.','color',colorMat(1,:));
end
hold off;