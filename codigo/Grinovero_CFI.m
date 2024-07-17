## Problema de difusión-reacción
## - K_0 * u''(x) + c_R(x) * u(x) = f(x)
## a = 0; b = L;

## Definición de funciones, constantes y variables
  a = 0;      % cm
  b = 2;      % cm
  A = 0.01;   % cm^2
  c = 0.217;  % cal/(g*°C)
  rho = 2.7;  % g/cm^3
  K_0 = 0.57; % cal/(s*cm*°C)
  f_cal = @(x) 12*cos(2*x);
  c_R = @(x) 5*(x-2);

## Despejar u''(x) para encontrar p(x), q(x), r(x)
  ## - K_0 * u''(x) + c_R(x) * u(x) = f(x)
  ## - K_0 * u''(x) = f_cal(x) - c_R(x) * u(x)
  ## u''(x) = (1/K_0) * c_R(x) * u(x) - (1/K_0) * f_cal(x)
  p = @(x) 0 * x;
  q = @(x) (1/K_0) * c_R(x);
  r = @(x) - (1/K_0) * f_cal(x);
  f = @(x) ([p(x) q(x) r(x)]);

## Valores de contorno
  ## u(0) = u_w
    alpha = 6;
  ## phi(x) = - K_0 * u'(x)
    ## - 40 = - K_0 * u'(2)
    ## K_0 * u'(2) + 0 * u(2) = 40
    A = K_0;
    B = 0;
    C = 40;

## Resolver y aproximar el flujo en 0
  h = 1;
  L = (b-a)./h;
  [x,u] = dif_fin_rob(f,[a b],alpha,[A B C],L);
  tol = 1e-4;

  du_0 = (u(2)-u(1))./h;

  for i=1:30
    h = 1/(2^i);
    L = (b-a)./h;
    [x,u] = dif_fin_rob(f,[a b],alpha,[A B C],L);

    du_prev = du_0;
    du_0 = (u(2)-u(1))./h;

    if (abs(du_0-du_prev)<tol)
      disp([num2str(i) ' iteraciones para encontrar du(0)=' num2str(du_0)]);
      break;
    endif
  endfor

## Graficar y_ex, y
  figure(1);
    clf;
    hold on;
    plot(x,u,'LineWidth',1.5);
    plot(x,f_cal(x),'LineWidth',1);
    grid on;

## Mostrar resultados
  phi_0 = - K_0 * du_0

## Energía térmica total
  L = length(u);
  E = 0;
  for i = 1:L-1
    E = E + ((u(i+1)+u(i))/2)*(1/L);
  endfor
  E


