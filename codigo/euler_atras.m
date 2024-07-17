function [t,y] = euler_atras(f,dfdy,a,b,y0,N)
tol=1e-9;           #tolerancia
kmax = 100;
h = (b - a) / N;
t = linspace(a,b,N+1)';
y = zeros(size(t));
y(1) = y0;

for n = 1:N
    yi = y(n);
    k=1;

    while k < kmax

      g = yi - y(n) - h * f(t(n+1),yi);
      dg = 1 - h * dfdy(t(n+1),yi);
      yi_new = yi - g/dg;

      if abs(yi_new - yi) < tol
        break;
      endif

      k=k+1;
      yi = yi_new;
    endwhile

    y(n+1) = yi;
endfor
endfunction
