## theta'' + f * theta' + sin(theta) = 0;
## theta'' = - f * theta' - sin(theta);

## y_1 = theta
## y_2 = theta'
## y_3 = theta''

## y_1' = y_2
## y_2' = - f * y_2 - sin(y_1);

  L=1;
  h=3/4;

## L cos(y0) = h;
## y0 = arccos(h/L)
  y0 = acos(h/L);

## Planteo la función f
  f = @(y) abs(y)<y0;

## Planteo el vector dY
  dY = @(t,Y) ([ Y(2) ;
                 - 0.8.*f(Y(1)).*Y(2)-sin(Y(1)) ]);

## Planteo el vector Y0
  Y0 = [pi/2 0]; % y(0)=pi/2, y'(0)=0

## Defino el intervalo y el salto
  a = 0;
  b = 5;
  h = 0.01;
  L = (b-a)./h;

## Resuelvo
  [t,Y] = rk4(dY,[a b],Y0,L);

## Grafico
  figure(1);
    plot(t,Y(:,1));
    grid on;
    hold on;
  figure(2);
    plot(t,Y(:,2));
    grid on;
    hold on;

##
  disp(['La posición del péndulo a tiempo t=5 con h=' num2str(h) ' es: ']);
  Y(end,1)




