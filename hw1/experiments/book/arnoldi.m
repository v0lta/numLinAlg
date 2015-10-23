



%% arnoldi iteration implementation. (compute eigenvalues)

b = [ 1 2 3]';
A = randn(3);

q = b/norm(b);
h = zeros(3,3);

%% start Arnoldi
for n = 1:3
    v = A*q(:,n);
    
    for j = 1:n
        h(j,n) = q(:,j)'*v;
        v = v - h(j,n)*q(:,j);       
    end
    h(n+1,n) = norm(v);
    q(:,n+1) = v/h(n+1,n);
end
q = q(1:3,1:3);
h = h(1:3,1:3);