clc
clear
n = 42;
delta = 10^-8;

J = diag(ones(n-1,1),1);
A = 4*J+4*J^2;
[V,D] = eig(A);
zeig = [];
con = [];

for i = 1:100
    B = 2*rand(n)-eye(n);
    [Q,R] = qr(B);
    zeig = [zeig eig(A+delta*Q)];
    if mod(i,10)==0
        [V1,D1] = eig(A+delta*Q);
        con = [con cond(V1,1)];
    end
end
plot(zeig,'.');
disp(con);