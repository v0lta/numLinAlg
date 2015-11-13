

clear all
load reg.mat;
[U,S,V] = svd(A1);

f = logspace(log10(S(1,1)),log10(S(end,end)),1000);
gcvVals = zeros(length(f),1);

for i = 1:length(f)
   gcvVals(i) =  gcv( f(i),U,S,V,A1,berr1 );    
end

fPick = fminbnd(@(f) gcv(f,U,S,V,A1,berr1),S(end,end),S(1,1));
[~,IPick] = min(abs(f-fPick));


loglog(f,gcvVals)
hold on
loglog(fPick,gcv(fPick,U,S,V,A1,berr1),'*')