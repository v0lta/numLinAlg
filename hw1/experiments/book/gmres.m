clear all;



%% arnoldi iteration implementation. (compute eigenvalues)
nEnd = 3;
b = [ 1 2 3]';
A = randn(nEnd);

q = b/norm(b);
%%h = zeros(3,3);


%% start Arnoldi
for n = 1:nEnd
    v = A*q(:,n);
    
    for j = 1:n
        h(j,n) = q(:,j)'*v;
        v = v - h(j,n)*q(:,j);       
    end
    h(n+1,n) = norm(v);
    q(:,n+1) = v/h(n+1,n);
 
    
end 
q = q(1:nEnd,1:nEnd);
h = h(1:nEnd,1:nEnd);

xArnd = inv(h*q')*q'*b;
%% implement better.
y = inv(h)*norm(b)*eye(3,1);
xArnd2 = q*y;
%% remover inverse.
[Q,R] = qr(h);
y = R\(Q'*norm(b)*eye(3,1));
xArnd3 = q*y;


