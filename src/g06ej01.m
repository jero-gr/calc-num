f = @(x) exp(x) - 2 * x.^2 + 3*x - 1;
x0 = 0;
## f' = exp(x) - 4x + 3
## f'' = exp(x) - 4
## f''' = exp(x)

## a) Fórmula de dos puntos
  h = 10 .^ [-1:-1:-11];
  df = (f(x0+h) - f(x0))./h;
  err = h/2 * (exp(x0) - 4);  ## err = h/2 * f'';
  stem(err);

## c) Fórmula de tres puntos
  h = 10 .^ [-1:-1:-11];
  df = (f(x0+h) - f(x0-h))./(2*h);
  err = ((h.^2)/6) * exp(x0); ## err = (h^2)/6 * f''';
  stem(err);
