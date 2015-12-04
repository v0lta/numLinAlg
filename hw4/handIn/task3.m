
%%  Plot the pseudospctra for the five matrices.
task2
close all

x0 = -1:0.01:3.5;
y0 = -4:0.01:4;

%just compute the pseudospectral data.
job2 = batch('computePseudo',1,{T0,x0,y0,dim});

x1 = -8:0.1:8;
y1 = -6:0.1:8;
job3 = batch('computePseudo',1,{T1,x1,y1,dim});

x2 = -4:0.01:2.5;
y2 = -3:0.01:4;
job4 = batch('computePseudo',1,{T2,x2,y2,dim});

x3 = -1:0.01:1.5;
y3 = -1.5:0.01:1.5;
job5 = batch('computePseudo',1,{T3,x3,y3,dim});

x4 = -15:0.1:20;
y4 = -15:0.1:20;
job6 = batch('computePseudo',1,{T4,x4,y4,dim});
