  ## - K_0 * ddu = f;
  ## ddu = - f / K_0;
  ## f(x) = 20 * sin(5*(x-1));

  ## ddu = p * du + q * u + r
  ## p = 0
  ## q = 0
  ## r = - f / K_0

  K_0 = 1;

  p = @(x) 0 * x;
  q = @(x) 0 * x;
  r = @(x) - (20 * sin(5*(x-1))) / K_0;
  f = @(x) ([p(x) q(x) r(x)]);

  ## a = 0, b = L;
  a = 0;
  b = 3;

  ## u(0) = 21
  alpha = 21;
  ## u'(3) = 0 -> A u'(3) + B u(3) = C
  A = 1; B = 0; C = 0;

  ## Resolver para h=0.01
  h = 0.01;
  L = (b-a)./h;
  [x,u] = dif_fin_rob(f,[a b],alpha,[A B C],L);

  ## Graficar y_ex, y
  figure(1);
    clf;
    hold on;
    plot(x,u,'LineWidth',1.5);
    plot(x,-r(x),'LineWidth',1);
    grid on;


