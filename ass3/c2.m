clear
clc
gendata
A = E;
AINV = inv(A);
AC = inv(AINV);
norma = norm(A*AINV-eye(6),1);
normb = norm(AC-A,1);
disp("The first norm is "+norma);
disp("The second norm is "+normb);

A = H;
AINV = inv(A);
AC = inv(AINV);
norma = norm(A*AINV-eye(6),1);
normb = norm(AC-A,1);
normc = norm(AINV-HI,1);
disp("The first norm is "+norma);
disp("The second norm is "+normb);
disp("The third norm is "+normc);

A = H8;
AINV = inv(A);
AC = inv(AINV);
norma = norm(A*AINV-eye(8),1);
normb = norm(AC-A,1);
normc = norm(AINV-HI8,1);
disp("The first norm is "+norma);
disp("The second norm is "+normb);
disp("The third norm is "+normc);
disp("k1(A) = "+cond(H8,1));
