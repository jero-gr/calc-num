## Ejercicio 1
  p_t_f = 3;
  K = 0.04;
  f = @(x) (x ./ (1-x)) .* sqrt((2*p_t_f)./(2+x)) - K;

  x=0:0.001:1;
  figure(1)
    plot(x,f(x));
    grid on;
    hold on;

  a=0;
  b=1;
  tol = 1e-8;
  format long;
  [x_b,h_1] = biseccion(f,a,b,100,tol);
  plot(x_b,f(x_b),"*r");
  disp(['x=' num2str(x_b)]);

## Ejercicio 2
  x_g = 0.02;
  g = @(p_t) (x_g ./ (1-x_g)) .* sqrt((2*p_t)./(2+x_g)) - K;
  p_t=0:0.01:20;

  figure(2)
    plot(p_t,g(p_t));
    grid on;
    hold on;

  a=0;
  b=5;
  tol = 1e-2;
  maxit = round(log2(abs(b-a)/tol))+1;
  [p_t_b,h_2] = biseccion(g,a,b,maxit,tol);
  plot(p_t_b,g(p_t_b),"*r");
  disp(['p_t=' num2str(p_t_b)]);
