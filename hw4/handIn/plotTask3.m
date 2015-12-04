
%plot the pseudospectra from earliear

%% job 2
sigmin0 = cell2mat(fetchOutputs(job2));
fig1 = figure(1);
v = [];
for i = 1:9
  v(i) = (i+1);
end
[c,h] = contour(x0,y0,-log10(sigmin0),v);
hold on
eigs = eig(T0);
plot(real(eigs),imag(eigs),'.')
colormap(fig1,parula)
%clabel(c,h);
hold off


%% job 3
sigmin1 = cell2mat(fetchOutputs(job7));
fig2 = figure(2);
v = [];
for i = 1:9
  v(i) = (i+1);
end
[c,h] = contour(x1,y1,-log10(sigmin1),v);
hold on
eigs = eig(T1);
plot(real(eigs),imag(eigs),'.')
colormap(fig2,parula)
%clabel(c,h)
hold off

%% job 4
sigmin2 = cell2mat(fetchOutputs(job4));
fig3 = figure(1);
v = [];
for i = 1:10
  v(i) = (i+1);
end
%v = [0.1 0.5 2 4];
contour(x2,y2,-log10(sigmin2),v);
hold on
eigs = eig(T2);
plot(real(eigs),imag(eigs),'.')
colormap(fig3,parula)
hold off

%% job 5
sigmin3 = cell2mat(fetchOutputs(job5));
fig4 = figure(1);
v = [];
for i = 1:9
  v(i) = (i+1);
end
contour(x3,y3,-log10(sigmin3),v);
hold on
eigs = eig(T3);
plot(real(eigs),imag(eigs),'.')
colormap(fig4,parula)
hold off

%% job 6
sigmin4 = cell2mat(fetchOutputs(job6));
fig5 = figure(1);
v = [];
for i = 1:9
  v(i) = (i+1);
end
%v = [0.1 0.5 2 4];
contour(x4,y4,-log10(sigmin4),v);
hold on
eigs = eig(T4);
plot(real(eigs),imag(eigs),'.')
colormap(fig5,parula)
hold off
