

clear all
load reg.mat;


A = {A1, A2, A3, A4, A5, A6};
b = {berr1, berr2, berr3 ,berr4 ,berr5, berr6};

for pair = 1:6

    Acurrent = cell2mat(A(pair));
    bcurrent = cell2mat(b(pair));

    [U,S,V] = svd(Acurrent);
    f = logspace(log10(S(1,1)),log10(S(end,end)),1000);
    gcvVals = zeros(length(f),1);

    for i = 1:length(f)
        gcvVals(i) =  gcv( f(i),U,S,V,Acurrent,bcurrent );    
    end

    fPick = fminbnd(@(f) gcv(f,U,S,V,Acurrent,bcurrent),S(end,end),S(1,1));
    [~,IPick] = min(abs(f-fPick));


    loglog(f,gcvVals)
    hold on
    loglog(fPick,gcv(fPick,U,S,V,Acurrent,bcurrent),'*')
    lambdasGCV(pair) = fPick;
end