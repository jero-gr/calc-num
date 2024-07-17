## theta'' + theta' + sin(theta) = 20*(cos(theta)).^2;
## theta'' = 20*(cos(theta)).^2 - theta' - sin(theta);

## y_1 = theta
## y_2 = theta'
## y_3 = theta''

## y_1' = y_2
## y_2' = 20*(cos(theta)).^2 - theta' - sin(theta);
## y_2' = 20*(cos(y_1)).^2 - y_2 - sin(y_1);

## Planteo el vector dY
  dY = @(t,Y) ([ Y(2) ;
                 20*(cos(Y(1)).^2) - Y(2) - sin(Y(1)) ]);

## Defino el intervalo y el salto
  a = 0;
  b = 20;
  h = 0.005;
  L = (b-a)./h;

## Planteo el vector de condiciones iniciales Y0
  Y0 = [pi/2 0]; % y(0)=pi/2, y'(0)=0 (desde el reposo)

## Resuelvo
  [t,Y] = rk4(dY,[a b],Y0,L);

## Grafico
  figure(1);
    clf;
    plot(t,Y(:,1),'LineWidth',1);
    title('phi(t)');
    grid on;
    hold on;
    plot(2.5,Y(t==2.5,1),"x",'LineWidth',1);
  figure(2);
    clf;
    plot(t,Y(:,2),'r-','LineWidth',1);
    title("phi'(t)");
    grid on;
    hold on;
    plot(2.5,Y(t==2.5,2),"x",'LineWidth',1);
    plot(4,Y(t==4,2),"|",'LineWidth',1);


## Resultados
  disp('a)');
  disp(['   El ángulo que forma el péndulo con la vertical a tiempo t=2.5 con h=' num2str(h) ' es: ']);
  Y(t==2.5,1)
  disp(' ');
  disp(['   La derivada del ángulo en ese tiempo es: ']);
  Y(t==2.5,2)
  disp(['   negativa, por lo que el péndulo se mueve de derecha a izquierda']);
  disp(' ');

  disp('b)');
  disp(["   En (0,4], la función phi'(t) se vuelve cero 3 veces." ; "   Esto significa que en ese intervalo el péndulo cambió 3 veces de dirección."]);
  disp(' ');

  disp('c)');
  disp(["   El ángulo del péndulo cuando t tiende a infinito es:"]);
  ang_inf = Y(end,1)
  disp(["   45 grados equivale a pi/4"]);
  ang_45 = pi/4
  disp(["   " num2str(ang_inf) " > " num2str(ang_45)]);

