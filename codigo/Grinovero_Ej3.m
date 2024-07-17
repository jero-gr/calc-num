## Ejercicio 3
## Elipse: x^2 * 16  + y^2 * 4   = 64
##         x^2 / 4   + y^2 / 16  = 1
##         x^2 / a^2 + y^2 / b^2 = 1
## a^2 = 4  ->  a = 2;
## b^2 = 16 ->  b = 4;

## Definición de constantes y funciones
  a = 2;
  b = 4;
  f_x = @(t) a * cos(t); % alpha es f(t)
  f_y = @(t) b * sin(t);

  df_x = @(t) - a * sin(t);
  df_y = @(t) b * cos(t);

  g = @(t) sqrt(f_x(t).^2 + f_y(t).^2);

## Gráfica de la elipse
  t = 0:0.01:2*pi;
  figure(1);
    clf;
    plot(f_x(t),f_y(t),"LineWidth",1.5);
    grid on;
    title('Elipse');
    axis([-3 3 -5 5]);

## Longitud de la elipse con cuadratura de Gauss compuesta L=1, n=1:...
  t1 = 0;
  t2 = 2*pi;
  L = 1;
  n = 1;
  long_a = cuad_gauss_c(g,t1,t2,L,n);

  for n=2:100
    it = n;
    long_a = [long_a cuad_gauss_c(g,t1,t2,L,n)];
    if (abs(long_a(end) - long_a(end-1)) < 1e-10)
      break;
    endif
  endfor

## Longitud de la elipse con cuadratura de Gauss compuesta L=3, n=2
  L = 3;
  n = 2;
  long_b = cuad_gauss_c(g,t1,t2,L,n);

## Muestra de resultados
   disp('Ejercicio 3');
   disp('a)');
   disp('La longitud de la elipse es: ');
   long_a(end)
   disp(' ');
   disp('b)');
   disp('Con n=2 y L=3, se obtiene: ');
   long_b
