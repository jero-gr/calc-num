## ddy = - (2./x) .* dy + (2.*(x.^2)) .* y + (sin(log(x)))/(x.^2);
## a = 1;
## b = 2;
## alpha = 1;
## beta = 2;

## Definición de funciones, constantes y variables
  p = @(x) -(2 ./ x);
  q = @(x) (2 ./ (x.^2));
  r = @(x) (sin(log(x))) ./ (x.^2);
  f = @(x) ([p(x) q(x) r(x)]);

  c_2 = (1/70)*(8 - 12 * sin(log(2)) - 4 * cos(log(2)));
  c_1 = (11/10) - c_2;
  y_ex = @(x) c_1 * x + (c_2 ./ (x.^2)) - (3/10) * sin(log(x)) - (1/10) * cos(log(x));

  a = 1;
  b = 2;
  alpha = 1;
  beta = 2;

## Resolver para h=0.1
  h = 0.1;
  L = (b-a)./h;
  [x_01,y_01] = disparo_lineal(f,[a b],[alpha,beta],L);
  ecm_01 = mean((y_01 - y_ex(x_01)).^2)

## Graficar y_ex, y
  figure(1);
    clf;
    plot(x_01,y_ex(x_01),'LineWidth',1.5);
    hold on;
    plot(x_01,y_01,'LineWidth',1.5);
    grid on;

## Resolver para h=0.01
  h = 0.01;
  L = (b-a)./h;
  [x_001,y_001] = disparo_lineal(f,[a b],[alpha,beta],L);
  ecm_001 = mean((y_001 - y_ex(x_001)).^2)

## Graficar y_ex, y
  figure(2);
    clf;
    plot(x_001,y_ex(x_001),'LineWidth',1.5);
    hold on;
    plot(x_001,y_001,'LineWidth',1.5);
    grid on;


