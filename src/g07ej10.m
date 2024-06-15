## y'' + sin(y) = 0;
## y'' = - sin(y);

## y_1 = y
## y_2 = y'
## y_3 = y''

## y_1' = y_2
## y_2' = - sin(y);

## Planteo el vector dY
dY = @(t,Y) ([ Y(2) ;
               -sin(Y(1)) ]);

## Defino el intervalo y el salto
a = 0;
b = 20;
h = 0.1;
L = (b-a)./h;

y_ini = [0.1 0.7 3 3.5 0 0 0 0];
dy_ini = [0 0 0 0 1 1.99 2 2.01];

for i=1:8

  ## Resuelvo
  Y0 = [y_ini(i) dy_ini(i)];
  [t,Y] = euler(dY,[a b],Y0,L);

  ## Ploteo
  subplot(2,4,i);
  plot(t,Y(:,1),'LineWidth',1.5);
  grid on;

endfor



