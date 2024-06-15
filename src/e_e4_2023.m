g = 9.81;
R = 6373002;
v0 = 1409.34;

## x'' = - (g * R^2) ./ ((x+R).^2);

## x_1 = x
## x_2 = x'
## x_3 = x''

## x_1' = x_2
## x_2' = - (g * R^2) ./ ((x_1+R).^2);

## Planteo los vectores dX y X0
  dX = @(t,X) ([ X(2) ;
                 -(g*R^2)./((X(1)+R).^2) ]);

  X0 = [0 v0]; ## x(0)=0, x'(0)=v0

## Defino el intervalo y el salto
  a = 0;
  b = 180;
  h = 0.1;
  L = (b-a)./h;

## Resuelvo
  [t,X] = rk4(dX,[a b],X0,L);

## Grafico
  figure(1);
    plot(t,X(:,1));
    grid on;
    hold on;
  figure(2);
    plot(t,X(:,2));
    grid on;
    hold on;

## Aproximar x y dx
  p_x = polyfit(t,X(:,1),2);
  x = @(p_t) polyval(p_x,p_t);
  p_dx = polyfit(t,X(:,2),1);
  dx = @(p_dt) polyval(p_dx,p_dt);


## Encontrar el cero de dx con precisión 6 digitos
  [dx_cero,it] = biseccion(dx,a,b,100,1e-6);
  figure(1);
    plot(dx_cero,x(dx_cero),"rx");

## Resultados
  disp(['a)' ; num2str( X(t==180,2)) ;  num2str(dx(180)) ; ' ' ]);
  disp(['b)' ; 'Altura máxima: ' num2str(x(dx_cero)) ; 'Tiempo de ascenso: ' num2str(dx_cero) ; ' ' ]);

## Plotear funcion aproximada
  figure(1);
    plot(t,x(t));
  figure(2);
    plot(t,dx(t));
