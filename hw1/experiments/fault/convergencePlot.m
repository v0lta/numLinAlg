clear all;

bicgstabFault
gmres0V10
gmres0V100
gmres1V10
gmres1V100


loglog(gmRes0V10)
hold on;
loglog(gmRes0V100)
loglog(gmRes1V10)
loglog(gmRes1V100)
loglog(bicRes)
legend('gmres lof 0 v10','gmres lof0 v 100','gmres lof1 v 10', ...
       'gmres lof1 v 10','bicgstab lof 1 V 100');
hold off;
