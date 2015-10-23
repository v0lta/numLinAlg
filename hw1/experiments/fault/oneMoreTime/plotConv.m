
gmres0V10  = load('gmres0V10.report');
gmres0V100 = load('gmres0V100.report');
gmres1V10  = load('gmres1V10.report');
gmres1V100 = load('gmres1V100.report');
bicgstab   = load('bicgstab.report'); 

loglog(gmres0V10(:,2))
hold on;
loglog(gmres0V100(:,2))
loglog(gmres1V10(:,2))
loglog(gmres1V100(:,2))
loglog(bicgstab(:,2))
legend('gmres(0,10)','gmres(0,100)','gmres(1,10)', ...
       'gmres(1,100)','bicgstab(0,10)');
grid on;
hold off;
