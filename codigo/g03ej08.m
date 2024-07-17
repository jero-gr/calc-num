L = 5; % Longitud de la viga en metros
w = 0.07; % Ancho de la sección rectangular de la viga en metros
s = 0.14; % Altura de la sección rectangular de la viga en metros

P = 1.0326*e + 4; % Carga distribuida por unidad de longitud
E = 210*e + 3; % Módulo de Young del acero
J = (w * s^3)/12; % Momento de inercia de la sección rectangular

N_h = 10; % Cantidad de subintervalos equiespaciados
h = L/N_h; % Longitud de los subintervalos equiespaciados
n = N_h - 3; % Tamaño de la matriz A

% Armado de la matriz A y el vector b
A = diag(6*ones(1,n),0) - diag(4*ones(1,n-1),1) - diag(4*ones(1,n-1),-1) + diag(ones(1,n-2),2) + diag(ones(1,n-2),-2);
b = (ones(1,n)*(h^4)*(P/(E*J)))';

% Definición de parámetros
tol = 1e-8;
maxit = 100;
x0 = zeros(1,n);

% Método de Jacobi
T_j = jacobi_T(A);
rho_T_j = max(abs(eig(T_j))); % >1 no converge

% Método de Gauss-Seidel
T_gs = gauss_seidel_T(A);
rho_T_gs = max(abs(eig(T_gs))); % <1 converge
[x_gs,it_gs,r_h_gs] = gauss_seidel(A,b,x0,maxit,tol); % Llega al límite de iteraciones

% Método SOR
w = sor_w(A,0.01,1,2);
T_w = sor_T(A,w);
rho_T_w = max(abs(eig(rho_T_w))); % <1 converge
[x_sor,it_sor,r_h_sor] = sor(A,b,x0,maxit,tol,w); % Converge en 83 iteraciones
