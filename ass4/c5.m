clc
clear

delta = 10^-8;
n = 10;
for n = 1:10
    t = 4*(n-1)/9-2;
    B = 2*rand(n) - eye(n);
    [Q, R] = qr(B);
    A = Q*diag(t)*Q';
    disp(eig(A));
    disp(eig(A+delta*Q));
    disp(eig(A+delta*(Q+transpose(Q))));
end