gmresLof0
gmresLof0V100
gmresLof1
gmresLof1V100
bicgstab

loglog(resLof0)
hold on
loglog(resLof0V100)
loglog(resLof1)
loglog(resLof1V100)
loglog(resBicStab)
hold off;
legend('GMRES Lof 0','GMRES Lof 0 V100', 'GMRES Lof 1 V10', ...
       'GMRES Lof 1 V100','BicStab Lof0 V10') 