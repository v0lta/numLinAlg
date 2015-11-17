
%check the picard conditions for the 6 matrices.

A = {A1,A2,A3,A4,A5,A6};
b = {berr1, berr2, berr3, berr4, berr5, berr6};

for i=1:6
    figure(i)
    cptnPicard(cell2mat(A(i)),cell2mat(b(i)));    
end