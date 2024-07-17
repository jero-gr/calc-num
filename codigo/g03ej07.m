% Armar matriz y vectores
n=1000;
A = diag(2:2:n*2,0) + diag(0.5:0.5:(n-2)*0.5,2) + diag(0.25:0.25:(n-4)*0.25,4) + diag(1.5:0.5:n*0.5,-2) + diag(1.25:0.25:n*0.25,-4);
b(1:n,1) = pi;
x0=zeros(1,n);

% Definir parámetros
tol = 1e-5;
maxit = 100;

% Método de Jacobi
T_j = jacobi_T(A);
rho_T_j = max(abs(eig(T_j))); % Es 0.75, menor a 1 por lo que el método converge

tic();
[x_j,it_j,r_h_j] = jacobi(A,b,x0,maxit,tol);
time_j = toc();

disp('Para el método de Jacobi:');
disp(['El radio espectral de la matriz A es ' num2str(rho_T_j) '.']);
disp(['El número de iteraciones fue ' num2str(it_j) '.']);
disp(['El tiempo de ejecución fue ' num2str(time_j) ' segundos.']);
disp(' ');

% Método de Gauss-Seidel
T_gs = gauss_seidel_T(A);
rho_T_gs = max(abs(eig(T_gs))); % rho_T_gs = 0.2359, converge

tic();
[x_gs,it_gs,r_h_gs] = gauss_seidel(A,b,x0,maxit,tol);
time_gs = toc();

disp('Para el método de Gauss-Seidel:');
disp(['El radio espectral de la matriz A es ' num2str(rho_T_gs) '.']);
disp(['El número de iteraciones fue ' num2str(it_gs) '.']);
disp(['El tiempo de ejecución fue ' num2str(time_gs) ' segundos.']);
disp(' ');

% Método SOR
tic();
w = sor_w(A,0.1,-1,3);
time_w = toc();

tic();
[x_sor,it_sor,r_h_sor] = sor(A,b,x0,maxit,tol,w);
time_sor = toc();

disp('Para el método SOR:');
disp(['El w ideal es ' num2str(w)]);
disp(['El tiempo de ejecución para encontrar el w ideal fue ' num2str(time_w) ' segundos.']);
disp(['El número de iteraciones fue ' num2str(it_sor) '.']);
disp(['El tiempo de ejecución fue ' num2str(time_sor) ' segundos.']);



