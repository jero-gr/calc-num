f = @(x) 3 * (x+0.5) .* sin((x - 2.7)/2).^4;
df = @(x) 3 * sin((x - 2.7)/2).^4 + 6 * sin((x - 2.7)/2).^3 .* cos((x - 2.7)/2) .* (x+0.5);

## x [0,2.4];
  x0 = 0;
  xn = 2.4;
  x = linspace(x0,xn,11);

## Spline
  [S,dS,ddS]=funcion_spline(x,f(x),df(x0),df(xn));

## Radio de la cúpula para x=1m
  disp('a)');
  r_1 = S(1)

## Plot
  figure(1);
    t=linspace(x0,xn);
    hold on;
    plot(x,f(x),"xr");
    plot(t,f(t),"r");
    plot(1,S(1),"xb");
    plot(t,S(t),"rb");

## Error
  e_1 = abs(f(1)-S(1))

## Integral
  g = @(x) 2 * pi * S(x) .* sqrt(1 + dS(x).^2);

  n = 3;
  for L=1:20;
    Q(L) = cuad_gauss_c(g,x0,xn,L,n);
  endfor

  disp(' ');
  disp('b)');
  disp('    L                         Area (n=3)');
  [ [1:20]' Q' ]

