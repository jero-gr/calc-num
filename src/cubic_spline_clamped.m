function [a,b,c,d]=cubic_spline_clamped(x,f,dy0,dyn)
  %% Tiene frontera libre:
  %% S''(x_0) = 0
  %% S''(x_n) = 0
  %% La curvatura es nula en los extremos
  n = length(x);

  %% a_i = f(x_i)
  a = f';

  %% h_i = x_(i+1) - x_i
  h = x(2:end)-x(1:end-1);
  h = h';

  %% Es un sistema Ax = b donde
  %% x = c

  A = eye(n);
  b_gauss = zeros(n,1);

  %% Condiciones clamped en los extremos
  A(1,1) = 2 * h(1);
  A(1, 2) = h(1);
  b_gauss(1) = 3 * ((a(2) - a(1)) / h(1) - dy0);

  A(n, n-1) = h(n-1);
  A(n, n) = 2 * h(n-1);
  b_gauss(n) = 3 * (dyn - (a(n) - a(n-1)) / h(n-1));

  for i = 2:n-1
    A(i,i) = 2*(h(i-1)+h(i));
    A(i,i-1) = h(i-1);
    A(i,i+1) = h(i);
    b_gauss(i) = (3/h(i))*(a(i+1)-a(i)) - (3/h(i-1))*(a(i)-a(i-1));
  endfor

  c = gauss(A,b_gauss);

  %% Ecuación (a)
  d = (c(2:end)-c(1:end-1)) ./ (3*h);

  %% Ecuación (b)                                !!! + (error en slides)
  b = (a(2:end) - a(1:end-1))./h - ((2 .* c(1:end-1) + c(2:end)) .* h)/3;

  a=a(1:end-1);
  c=c(1:end-1);
endfunction
