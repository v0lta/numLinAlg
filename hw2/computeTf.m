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
[V1,D1] = eigs(A,E,1);
[V5,D5] = eigs(A,E,5);
[V10,D10] = eigs(A,E,10);
[V50,D50] = eigs(A,E,50);

approxA1 = V1*D1*V1';
approxA5 = V5*D5*V5';
approxA10 = V10*D10*V10';
approxA50 = V50*D50*V50';

for k =1:length(s)
    H1(k) = B'*((s(k)*E(1,1) - approxA1)\B);
    H5(k) = B'*((s(k)*E - approxA5)\B);
    H10(k) = B'*((s(k)*E - approxA10)\B);
    H50(k) = B'*((s(k)*E - approxA50)\B);
end
