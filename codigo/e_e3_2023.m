t_x = 0:2:6;
t_y = 0:6;
x = [2 1.5 0.5 0];
y = [0 1 0 -1 0 1 0];

## y'(0) = pi/2
## y'(6) = -pi/2

[a,b,c,d] = cubic_spline_clamped(t_x,x,0,0);
abcd_x = [a b c d];
[a,b,c,d] = cubic_spline_clamped(t_y,y,pi/2,-pi/2);
abcd_y = [a b c d];

[T_x,P_x] = cubic_spline_eval(abcd_x,t_x,0.1);
[T_y,P_y] = cubic_spline_eval(abcd_y,t_y,0.1);

[pos_x, v_x] = funcion_spline(t_x,x,0,0);
[pos_y, v_y] = funcion_spline(t_y,y,pi/2,-pi/2);

## Trayectoria de la partícula
figure(1);
  plot(x,y(1:2:7),"x");
  hold on;
  plot(P_x,P_y);

## Posición en t=3
%[P_x(T_x==3) P_y(T_y==3)]
[pos_x(3) pos_y(3)]

## Velocidad en t=3
[v_x(3) v_y(3)];

## Longitud de trayectoria
a = 0;
b = 6;
f = @(t) sqrt( v_x(t).^2 + v_y(t).^2 );

maxit = 100;

L=10;
Q_2 = cuad_gauss_c(f,a,b,L,2)
Q_3 = cuad_gauss_c(f,a,b,L,3)
Q_4 = cuad_gauss_c(f,a,b,L,4)
Q_5 = cuad_gauss_c(f,a,b,L,5)







