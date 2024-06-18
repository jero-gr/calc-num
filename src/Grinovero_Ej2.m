## Ejercicio 2

## Cambio de orden del sistema
  ## m_1 * x_1'' = - (m_1 * g * x_1)/l - k * (x_1 - x_2);
  ## x_1'' = - (g * x_1)/l - (k/m_1) * (x_1 - x_2);

  ## m_2 * x_2'' = - (m_2 * g * x_2)/l + k * (x_1 - x_2);
  ## x_2'' = - (g * x_2)/l + (k/m_2) * (x_1 - x_2);

  ## y_1 = x_1
  ## y_2 = x_1'

  ## y_3 = x_2
  ## y_4 = x_2'

  ## y_1' = y_2
  ## y_2' = - (g * Y(1))/l - (k/m_1) * (Y(1) - Y(3));

  ## y_3' = y_4
  ## y_4' = - (g * Y(3))/l + (k/m_2) * (Y(1) - Y(3));

## Definición de constantes
  g = 9.81; % m/s^2
  l = 15;   % m
  m_1 = 3;  % kg
  m_2 = 1;  % kg
  k = 4;    % N/m

## Planteo los vectores dY e Y0

  dY = @(t,Y) ([ Y(2) ;
                 - (g * Y(1))/l - (k/m_1) * (Y(1) - Y(3));
                 Y(4) ;
                 - (g * Y(3))/l + (k/m_2) * (Y(1) - Y(3)) ]);

  Y0 = [0 0 0.5 0];

## Defino el intervalo y el salto
  a = 0;
  b = 10;
  h = 1;
  L = (b-a)./h;

## Resuelvo para h=1;
  [t,Y] = rk4(dY,[a b],Y0,L);
  x1_10 = Y(end,1);
  x2_10 = Y(end,3);


## Lazo para refinar el resultado
  for i=1:10
    h=1/(2^i);
    L = (b-a)./h;
    [t,Y] = rk4(dY,[a b],Y0,L);

    x1_10 = [x1_10 Y(end,1)];
    x2_10 = [x2_10 Y(end,3)];

    err_x1 = abs(x1_10(end) - x1_10(end-1));
    err_x2 = abs(x2_10(end) - x2_10(end-1));

    if((err_x1<1e-6) && (err_x2<1e-6))
      break;
    endif
  endfor


## Animación
  figure(1);
  clf;

  for i=1:4:length(t)
    x_1 = Y(i,1);
    x_2 = Y(i,3);
    clf;
    hold on;
    ## m_1
      plot(x_1,0,"ob","LineWidth",1);
      plot([x_1 0],[0 15],"b");
    ## m_2
      plot(x_2,0,"or","LineWidth",1);
      plot([x_2 0.5],[0 15],"r");
    ## Resorte
      plot([x_1 x_2],[0 0],"black");
      axis([-1 1 -1 2]);
    pause(h)
  endfor


## Gráficos de posición y derivada
  figure(2);
    plot(t,Y(:,1),"b","LineWidth",1.5);
    hold on;
    grid on;
    plot(t,Y(:,2),"--b","LineWidth",1);
    title('x_1, dx_1');

  figure(3);
    plot(t,Y(:,3),"r","LineWidth",1.5);
    hold on;
    grid on;
    plot(t,Y(:,4),"--r","LineWidth",1);
    title('x_2, dx_2');

## Resultados
  disp(['Ejercicio 2:']);
  disp(['Posición del primer objeto en t=10: ' num2str(Y(end,1))]);
  disp(['Derivada de posición del primer objeto en t=10: ' num2str(Y(end,2))]);
  disp(['La derivada es negativa, por lo que se mueve de derecha a izquierda']);

  disp(' ');

  disp(['Posición del segundo objeto en t=10: ' num2str(Y(end,3))]);
  disp(['Derivada de posición del segundo objeto en t=10: ' num2str(Y(end,4))]);
  disp(['La derivada es positiva, por lo que se mueve de izquierda a derecha']);
