disp("Ejercicio 3:");
P = @(x) 230 * x.^4 + 18 * x.^3 + 9 * x.^2 - 221*x - 9;
x = -0.2:0.01:1;

% Ploteo del polinomio y la función y=x
figure(1);
plot(x,P(x));
  grid on;
  hold on;
  plot(x,x);

% Ploteo del polinomio aumentado en el eje y para ver las intersecciones con la recta y=x
  figure(2)
  plot(x,P(x));
  grid on;
  hold on;
  plot(x,x);
  axis([-0.2,1,-1.5,1.5])

% Resto x al polinomio para obtener el punto fijo
P_1 = @(x) 230 * x.^4 + 18 * x.^3 + 9 * x.^2 - 222*x - 9;

% Punto fijo 1:
  a = -0.2;
  b = 0;
  maxit = 100;
  tol = 1e-9;
  [x_1,it_1] = biseccion(P_1,a,b,maxit,tol);
  x_1
  plot(x_1,P(x_1),"*r");

% Punto fijo 2:
  a = 0.8;
  b = 1;
  maxit = 100;
  tol = 1e-9;
  [x_2,it_2] = biseccion(P_1,a,b,maxit,tol);
  x_2
  plot(x_2,P(x_2),"*r");


