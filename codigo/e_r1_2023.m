### Ejercicio 3
##  P = @(x) 230 * x.^4 + 18 * x.^3 + 9 * x.^2 - 221*x - 9;
##  x = -0.5:0.1:1.5;
##
##  figure(1);
##  plot(x,P(x));
##    grid on;
##    hold on;
##
##  # a)
##    a = -0.3;
##    b = 0;
##    tol = 1e-7;
##    [x_b1,it_b1] = biseccion(P,a,b,100,tol);
##    plot(x_b1,P(x_b1),"*r");
##
##    a = 0.75;
##    b = 1;
##    tol = 1e-7;
##    [x_b2,it_b2] = biseccion(P,a,b,100,tol);
##    plot(x_b2,P(x_b2),"*r");
##
##  # b)
##    dP = @(x) 4 * 230 * x.^3 + 3*18 * x.^2 + 2*9 * x - 221;
##
##    figure(2);
##      plot(x,dP(x));
##      grid on;
##      hold on;
##

n = 40;
A = zeros(n) + 2 * diag(1:n) + diag(-ones(1,n-1),1) + diag(-ones(1,n-1),-1);
b = (1:n)' * 1.5 - 6;

# a)
  x = gauss(A,b);
  % x(1) = -3.0761

# b)


