A_1 = [3 1 1;
       1 3 -1;
       3 1 -5];

b_1 = [5 3 -1]';

A_2 = [3 1 1;
       3 1 -5;
       1 3 -1];

b_2 = [5 -1 3]';

x0 = [0 0 0];
tol = 1e-5;
max_it = 100;

T_gs1 = gauss_seidel_T(A_1);
T_gs2 = gauss_seidel_T(A_2);

rho_T_gs1 = max(abs(eig(T_gs1)));
rho_T_gs2 = max(abs(eig(T_gs2)));

[x_gs1,it_gs1,r_gs1] = gauss_seidel(A_1,b_1,x0,max_it,tol);

x_g1 = gauss(A_1,b_1);
x_g2 = gauss(A_2,b_2);

x_gp1 = gauss_p(A_1,b_1);
x_gp2 = gauss_p(A_2,b_2);
