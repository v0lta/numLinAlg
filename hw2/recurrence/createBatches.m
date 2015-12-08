%% create interesting convergence plain computation-batches
% and submit them for parallel execution.
% use plotBatch to see the results.

A = [1 1 1;
     0 1 3;
     0 0 1];
B = [1 2 -2;
     0 2 4;
     0 0 3];
R = [ -0.303440924786016   0.888395631757642  -0.809498694424876;
0.293871467096658  -1.147070106969150  -2.944284161994896;
-0.787282803758638  -1.068870458168032   1.438380292815098];

job1 = batch('GMRESOneTwo',3,{A,500});
job2 = batch('GMRESOneTwo',3,{B,500});
job3 = batch('GMRESOneTwo',3,{R,500});
job4 = batch('GMRESOneTwo',3,{(R+2*eye(3)),500});
job5 = batch('GMRESOneTwo',3,{(R+3*eye(3)),500});
job6 = batch('GMRESOneTwo',3,{(A+1*eye(3)),500});
job7 = batch('GMRESOneTwo',3,{(A+2*eye(3)),500});
job8 = batch('GMRESOneTwo',3,{(A-0.25*eye(3)),500});
job9 = batch('GMRESOneTwo',3,{(A-0.5*eye(3)),500});
job10 = batch('GMRESOneTwo',3,{(A-1*eye(3)),500});
job11 = batch('GMRESOneTwo',3,{(A-0.35*eye(3)),500});
