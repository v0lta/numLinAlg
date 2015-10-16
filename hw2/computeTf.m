clear all
%%load matrices
A = mmread('spiral_inductor_peec.A');
B = mmread('spiral_inductor_peec.B');
E = mmread('spiral_inductor_peec.E');


%% compute tf.
s = 1i*logspace(-5,10,100);

%%H = B'*pinv(s*E - A)*B;

for k =1:length(s)
    H(k) = B'*((s(k)*E - A)\B);
end
plot(abs(H));
%% approximate norms.

h2Norm = sqrt(1/(pi) * abs(H'*H));
%% Hinf = max(eig(A));


%% modal truncation
[V1,D1] = eigs(A,E,1,'lr');
[V5,D5] = eigs(A,E,5,'lr');
[V10,D10] = eigs(A,E,10,'lr');
[V50,D50] = eigs(A,E,50,'lr');

V1 = orth(V1);
V5 = orth(V5);
V10 = orth(V10);
V50 = orth(V50);

apxA1 = V1'*A*V1;
apxB1 = V1'*B;
apxE1 = V1'*E*V1;

apxA5 = V5'*A*V5;
apxB5 = V5'*B;
apxE5 = V5'*E*V5;

apxA10 = V10'*A*V10;
apxB10 = V10'*B;
apxE10 = V10'*E*V10;

apxA50 = V50'*A*V50;
apxB50 = V50'*B;
apxE50 = V50'*E*V50;

for k =1:length(s)
    H1(k) = apxB1'*((s(k)*apxE1 - apxA1)\apxB1);
    H5(k) = apxB5'*((s(k)*apxE5 - apxA5)\apxB5);
    H10(k) = apxB10'*((s(k)*apxE10 - apxA10)\apxB10);
    H50(k) = apxB50'*((s(k)*apxE50 - apxA50)\apxB50);
end

figure
loglog(abs(H))
hold on
loglog(abs(H1))
loglog(abs(H5))
loglog(abs(H10))
loglog(abs(H50))
legend('original','h1','h5','h10','h50')

%% Krylov subspace






