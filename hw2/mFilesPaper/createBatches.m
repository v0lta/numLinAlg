

%% create batches for parallel computations.

A = [ -0.303440924786016   0.888395631757642  -0.809498694424876;
0.293871467096658  -1.147070106969150  -2.944284161994896;
-0.787282803758638  -1.068870458168032   1.438380292815098];
B = [1 1 1;
     0 1 3;
     0 0 1];

 
job1 = batch('GMRESOneTwo',3,{A,100});
job10 = batch('GMRESOneTwo',3,{(B+1*eye(3)),500});
job11 = batch('GMRESOneTwo',3,{(B+2*eye(3)),500});
job12 = batch('GMRESOneTwo',3,{(B-0.25*eye(3)),500});
job13 = batch('GMRESOneTwo',3,{(B-0.5*eye(3)),500});
job14 = batch('GMRESOneTwo',3,{(B-1*eye(3)),500});

job15 = batch('GMRESOneTwo',3,{(B-0.35*eye(3)),500});