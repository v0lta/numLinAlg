

clear all
load reg.mat
A = {A1 A2 A3 A4 A5 A6};
figure(1)
hold on
for i= 1:6
   eigs = eig(cell2mat(A(i)));
   loglog(real(eigs),imag(eigs),'*')
end
legend('A1','A2','A3','A4','A5','A6')
hold off