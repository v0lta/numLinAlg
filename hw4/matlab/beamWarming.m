
function [teig,spsi,sakap] = beamWarming(c,r,nn)
%toeasy
% Find the asymptotic (size approaches infinity) spectrum 'teig'
% and sakap as well as spsi.
% For a banded Toeplitz matrix with first column c and first row
% r (only banded prot of clumn and row) 'nn' is a measure of the 
% number of points computed on the spectrum.

diag = c(1);
lr = length(r);
nr = lr - 1;
lc = length(c);
nc = lc - 1;
ct = c(2:lc);
rt = r(2:lr);
mv = nr:-1:-nc;
pc0 = [fliplr(rt) 0 ct];
teig  = 1:(nc + nr) * nn;
spsi  = 1:(nc + nr) * nn;
sakap = 1:(nc + nr) * nn;
eigct = 0;
epst = 1000*eps;
for j = 1:nn
    psi = j*pi/(nn + 1);
    mvs = sin(mv*psi);
    pe = pc0 .* mvs;
    nroot = nc + nr;
    if (pe(2) ~= 0);    
        if(abs(pe(1)/pe(2) < 1000*eps))
            pe = pe(2:nroot+1);
            nroot = nroot - 1;
        end
    end
    ke = roots(pe);
    for k = 1:nroot
    %for k = 1:length(ke)    
        if ke(k) ~= 0
            kap = ke(k)*exp(1i*psi);
            lam = -(kap .^ mv)* pc0'; 
            pc = [fliplr(rt) lam ct];
            kc = roots(pc);
            akap = abs(kap);
            akc = abs(kc);
            skap = sort(akc);
            test = abs((skap(nc) - skap(nc+1))/(skap(nc) + skap(nc+1)));
            if (test < epst && skap(nc) > akap*( 1-epst ) && skap(nc) < akap*(1+epst));
                eigct = eigct + 1;
                teig(eigct) = -(lam - diag);
                spsi(eigct) = psi;
                sakap(eigct) = akap;
            end
        end
    end
end
teig = teig(1:eigct);
spsi = spsi(1:eigct);
sakap = sakap(1:eigct);
end