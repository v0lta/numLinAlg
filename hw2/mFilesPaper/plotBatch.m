

res = fetchOutputs(job15);
r1Plain = cell2mat(res(1));
r2Plain = cell2mat(res(2));
x = cell2mat(res(3));
y = x;



disp('Plotting')
tickLabels = sort([0 -5 -10 -15]);
figure(1)
r1Plot = surf(x,y,log(r1Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
figure(2)
r2Plot = surf(x,y,log(r2Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
