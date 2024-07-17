## y''' + 4*y'' + 5*y' + 2*y = -4*sin(t) - 2*cos(t)
## y''' = - 4*sin(t) - 2*cos(t) - 4*y'' - 5*y' - 2*y

##y_1 = y
##y_2 = y'
##y_3 = y''

## y_1' = y_2
## y_2' = y_3
## y_3' = - 4*sin(t) - 2*cos(t) - 4*y_3 - 5*y_2 - 2*y_1

## Planteo los vectores dY e Y0
dY = @(t,Y) ([ Y(2) ;
               Y(3) ;
               -4*sin(t) - 2*cos(t) - 4*Y(3) - 5*Y(2) - 2*Y(1) ]);

Y0 = [1 0 -1]; ## y(0)=1, y'(0)=0, y''(0)=-1

## Defino el intervalo y el salto
a = 0;
b = 2.5;
h = 0.05;
L = (b-a)./h;

[t,Y] = euler(dY,[a b],Y0,L);

## Ploteo
plot(t,Y(:,1),'LineWidth',1.5);
hold on;
plot(t,Y(:,2),'--','LineWidth',1);
plot(t,Y(:,3),'--','LineWidth',1);

