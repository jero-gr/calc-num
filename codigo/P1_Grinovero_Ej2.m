disp("Ejercicio 2:");
# a)
  A = [3 1 -1 1 2;
       1 3 2 -2 -2;
       -2 -2 1 -2 -2;
       2 -1 -1 3 2;
       0 0 1 1 2];

  b = [1 4 -1 2 2]';

  [x_g] = gauss(A,b);
  disp("a)");
  x_g

# b)
  tol = 1e-4;
  maxit = 200;
  x0= [0 0 0 0 0];

  % Método de Jacobi
  T_j = jacobi_T(A);
  rho_T_j = max(abs(eig(T_j))); % rho_T_j = 0.9369, menor a 1 por lo que el método converge
  [x_j,it_j,r_h_j] = jacobi(A,b,x0,maxit,tol);

  disp(" ");
  disp("b)");
  x_j = x_j'
  it_j

  % Método de Gauss-Seidel
  T_gs = gauss_seidel_T(A);
  rho_T_gs = max(abs(eig(T_gs))); % rho_T_gs = 1.6578, es mayor a 1 por lo que no converge
  [x_gs,it_gs,r_h_gs] = gauss_seidel(A,b,x0,maxit,tol);
  % Los resultados están muy lejos de los obtenidos en Gauss y Jacobi, incluso pasando las miles de iteraciones, porque el método no converge


# c)
  disp(" ");
  disp("c)");
  e_rel = max(abs(x_j-x_g))/max(abs(x_g))
