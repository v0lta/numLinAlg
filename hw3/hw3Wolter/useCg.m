
load('reg.mat');

A = {A1,A2,A3,A4,A5,A6};
b = {berr1,berr2,berr3,berr4,berr5,berr6};

%choose matrix
i = 1;
Ain = cell2mat(A(i));
bin = cell2mat(b(i));
cg(Ain,bin,100,true);




%6 läuft nich
%5 auch nicht.
%4 ok.
%3 ok.
%2 ok.
%1 ok.