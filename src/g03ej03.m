A = [2 -1; -1 2];
b = [1 1]';
x0 = [10 10];
maxit = 100;
tol=0.001;

[x_j,it_j,r_j] = jacobi(A,b,x0,maxit,tol);
[x_gs,it_gs,r_gs] = gauss_seidel(A,b,x0,maxit,tol);

A = [3/4 1/6; 1/4 1/4];
T_gs = gauss_seidel_T(A);
rho_T = max(abs(eig(T_gs)));
% rho_T = 0.222 < 1. Entonces, el método converge.



