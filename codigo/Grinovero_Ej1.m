## Ejercicio 1

## Carga de datos
  t = [1:12]';
  y = load("datos1.txt");

## Gráfico de los datos
  figure(1);
    clf;
    plot(t,y,"xr","LineWidth",1)
    grid on;
    hold on;
    axis([1 12 10 30]);

## Armado de matriz y resolución para obtener coeficientes y la función aproximada
  A = [t, ones(length(t),1), sin((pi/6)*t), cos((pi/6)*t)];
  c = gauss((A' * A),(A' * y));
  f = @(t) c(1) * t + c(2) + c(3) * sin((pi/6)*t) + c(4) * cos((pi/6)*t);

## Gráfico de la función aproximada
  t_f = 1:0.1:14;
  figure(1);
    plot(t_f,f(t_f),"-","LineWidth",1)
     axis([1 12 10 30]);

## Resultados inciso a
  disp('a)');
  disp(['a = ' num2str(c(1))]);
  disp(['b = ' num2str(c(2))]);
  disp(['c = ' num2str(c(3))]);
  disp(['d = ' num2str(c(4))]);
  disp(' ');

## Cálculo del error cuadrático
  EC_abs = sum((y - f(t)).^2);

## Resultados inciso b
  disp('b)');
  disp(['Error cuadrático absoluto = ' num2str(EC_abs)]);
  disp(' ');

## Cálculo de la temperatura media en enero 2020
  f_01_2020 = f(13);

## Gráfico de la temperatura media en enero 2020
  figure(1);
    plot(13,f_01_2020,"xg","LineWidth",1)
    axis([1 14 10 30]);

## Cálculo del error relativo
  e_rel = abs(f_01_2020-27)/27;

## Resultados inciso c
  disp('c)');
  disp(['La temperatura media en enero de 2020 según el modelo es ' num2str(f_01_2020)]);
  disp(['El error relativo cometido por el modelo es ' num2str(e_rel) ]);
  disp(' ');
