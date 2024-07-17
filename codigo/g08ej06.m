## -K_0 u''(x) + c_R(x).*u(x) = f(x)
## u'' = (1/K_0) * c_R(x).*u(x) - (1/K_0)*f(x);

## Definición de funciones, constantes y variables
  a = 0;
  b = 5;

  K_0 = 0.9; % cal / (s*cm*°C)
  H = 15;
  u_E = 4;
  f_cal = @(x) 5 .* x .* (5-x);
  c_R = @(x) 1.05 .* x + 2;

  ## p(x) = 0;
  ## q(x) = (1/K_0) * c_R(x)
  ## r(x) = - (1/K_0)*f(x);
  p = @(x) 0 .* x;
  q = @(x) (1/K_0) .* c_R(x);
  r = @(x) -(1/K_0) .* 5 .* x .* (5-x);
  f = @(x) ([p(x) q(x) r(x)]);
  ## u(a) = 6;
  alpha = 6;

  ## -K_0*u'(L) = H*(u(L)-u_E)
  ## K_0 * u'(L) + H * u(L) = H*u_E
  ## A = K_0;
  ## B = H;
  ## C = H*u_E;
  A = K_0;
  B = H;
  C = H*u_E;

## Resolver para h=0.01
  h = 0.01;
  L = (b-a)./h;
  [x,u] = dif_fin_rob(f,[a b],alpha,[A B C],L);

## Graficar u
  figure(1);
    clf;
    hold on;
    plot(x,u,'LineWidth',1.5);
    plot(x,f_cal(x),'LineWidth',1);
    grid on;
