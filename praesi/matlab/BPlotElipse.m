res = fetchOutputs(job2);
r1Plain = cell2mat(res(1));
r2Plain = cell2mat(res(2));
x = cell2mat(res(3));
y = x;


xElipse = -5.69:0.05:-0.34;

%p = 2.*xElipse-2;
%q = xElipse.*((+4).*xElipse - 4) + 3;

p = -2+ 2.*xElipse;
q = xElipse.*( 2.*xElipse + 4) + 3;

pq1 = -p./2 + sqrt( (p./2).^2 - q);
pq2 = -p./2 - sqrt( (p./2).^2 - q);

colorMat = lines;

surf(x,y,log(r1Plain));shading('flat');view([0,90]);colorbar;caxis([-15 0]);
hold on
plot(xElipse,real(pq1),'color',colorMat(2,:),'LineWidth',3)
plot(xElipse,real(pq2),'color',colorMat(2,:),'LineWidth',3)
xlabel('$\eta$','interpreter','latex')
ylabel('$\xi$','interpreter','latex')
hold off