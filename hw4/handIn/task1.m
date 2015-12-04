% task 1 from hw 4
dim = 64;
A = gallery('grcar',dim);


%% use eigtool
%[x,y,sigs] = eigtool(A);

%% use my code
x = -1:0.01:3;
y = -3:0.01:3;

%just compute the pseudospectral data.
job1 = batch('computePseudo',1,{A,x,y,dim});



