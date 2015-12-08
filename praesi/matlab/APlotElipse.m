res = fetchOutputs(job1);
r1Plain = cell2mat(res(1));
r2Plain = cell2mat(res(2));
x = cell2mat(res(3));
y = x;

xElipse = -1:0.1:1.75;
p = 3+xElipse;
q = xElipse.*(xElipse+1) + 1;
pq1 = -p./2 + sqrt( (p./2).^2 - q);
pq2 = -p./2 - sqrt( (p./2).^2 - q);

colorMat = lines;

surf(x,y,log(r1Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
hold on
plot(real(pq1),xElipse,'color',colorMat(2,:),'LineWidth',3)
plot(real(pq2),xElipse,'color',colorMat(2,:),'LineWidth',3)
xlabel('$\eta$','interpreter','latex')
ylabel('$\xi$','interpreter','latex')
hold off

