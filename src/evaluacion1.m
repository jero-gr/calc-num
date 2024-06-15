% Armar matriz y vectores
n=40;
A=diag(2*ones(1,n),0)-diag(ones(1,n-1),-1)-diag(ones(1,n-1),1);
b=(1.5:1.5:1.5*n)'-6;

% Método de Gauss
x = gauss(A,b);

% Definir parámetros para métodos iterativos
tol = 1e-5;
maxit = 3000;
x0 = zeros(1,n);

% Método de Jacobi
T_j = jacobi_T(A);
rho_T_j = max(abs(eig(T_j))); % rho_T_j = 0.9971, es menor a 1 así que converge
[x_j,it_j,r_h_j] = jacobi(A,b,x0,maxit,tol);

% Método de Gauss-Seidel
T_gs = gauss_seidel_T(A);
rho_T_gs = max(abs(eig(T_gs))); % rho_T_j = 0.9941, es menor a 1 así que converge
[x_gs,it_gs,r_h_gs] = gauss_seidel(A,b,x0,maxit,tol);

% Método SOR
w = 1.85;
T_w = sor_T(A,w);
rho_T_w = max(abs(eig(T_w))); % rho_T_j = 0.8968, es menor a 1 así que converge
[x_sor,it_sor,r_h_sor] = sor(A,b,x0,maxit,tol,w);

% Mostrar resultados
disp(['Jacobi: ' num2str(it_j) ' iteraciones.']);
disp(['Gauss-Seidel: ' num2str(it_gs) ' iteraciones.']);
disp(['SOR: ' num2str(it_sor) ' iteraciones.']);
