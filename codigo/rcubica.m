function x_sol = rcubica(a)
  f = @(x) x.^3 - a;
  x_a = 0;
  x_b = a;
  tol = 1e-12;

  plot(t=x_a:0.01:x_b,f(t));
  grid on;
  hold on;

  kmax = round(log2(abs(x_b-x_a)/tol))+1;

  x_sol = biseccion(f,x_a,x_b,kmax,tol);

  plot(x_sol,0,"*");

endfunction

