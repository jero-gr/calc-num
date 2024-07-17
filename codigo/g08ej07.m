#### Disipador de calor ####

## ((D*W_1)/L) .* (L - x) .* u''(x) - ((D*W_1)/L) .* u'(x) = (H/k) .* (((2*W_1)/L) .* (L-x) + 2*D) .* (u(x) - u_E)
## u(0) = u_w
## -k*u'(L_1) = H * (u(L_1)-u_E)

## Definición de funciones, constantes y variables
  W_1 = 2;
  L = 6;
  L_1 = 4;
  D = 0.2;
  k = 2.04;
  H = 6e-3;
  u_w = 200;
  u_E = 40;

  ## ((D*W_1)/L) .* (L - x) .* u''(x) = ((D*W_1)/L) .* u'(x) + (H/k) .* (((2*W_1)/L) .* (L-x) + 2*D) .* (u(x) - u_E)
  p = @(x) 1 ./ (L-x);
  q = @(x) ((H/k) .* (((2*W_1)/L) .* (L-x) + 2*D)) ./ (((D*W_1)./L) .* (L-x));
  r = @(x) - ((H/k) .* (((2*W_1)/L) .* (L-x) + 2*D) .* u_E) ./ (((D*W_1)./L) .* (L-x));
  f = @(x) ([p(x) q(x) r(x)]);

  ## u(0) = u_w
  a = 0;
  alpha = u_w;

  ## -k*u'(L_1) = H * (u(L_1)-u_E)
  ## k*u'(L_1) + H*u(L_1) = H*u_E;
  b = L_1;
  A = k;
  B = H;
  C = H*u_E;

## Resolver para h=0.01
  h = 0.01;
  intervalos = (b-a)./h;
  [x,u] = dif_fin_rob(f,[a b],alpha,[A B C],intervalos);

## Graficar u
  figure(1);
    clf;
    hold on;
    plot(x,u,'LineWidth',1.5);
    grid on;

## Cálculo del flujo

