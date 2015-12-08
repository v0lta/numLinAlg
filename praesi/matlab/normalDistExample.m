%% normal dist sum example.
close all

d1 = 0.00001 + 0.05*abs(randn(10000,1));
d2 = 0.1 + 0.05*abs(randn(10000,1));

%d1 = poisspdf([0:0.1:10],4);
%d2 = 4 + poisspdf([0:0.1:10],4);

figure(1)
subplot(1,3,1)
histogram(d1)
hold on
histogram(d2)
hold off

subplot(1,3,2)
histogram([d1 d2])

subplot(1,3,3)
histogram((log([d1 d2])))