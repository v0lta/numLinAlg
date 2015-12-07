res = fetchOutputs(job1);
r1Plain = cell2mat(res(1));
r2Plain = cell2mat(res(2));
x = cell2mat(res(3));
y = x;

figure(1)
histogram(log(r1Plain(:)))
figure(2)
histogram(log(r1Plain(:)))
%No noise with matrix A!

res = fetchOutputs(job2);
r1Plain = cell2mat(res(1));
r2Plain = cell2mat(res(2));
x = cell2mat(res(3));
y = x;

figure(3)
subplot(1,2,1)
r1Plot = surf(x,y,log(r1Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
subplot(1,2,2)
histogram(log(r1Plain(:)))
figure(4)
subplot(1,2,1)
r1Plot = surf(x,y,log(r2Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
subplot(1,2,2)
histogram(log(r1Plain(:)))
!very nice!.


