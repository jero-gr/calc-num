h = [1/10 1/20 1/40 1/80 1/160 1/320]';
dy = @(t,y) - y + sin(t) + cos(t);
y0 = 0;
a = 0;
b = 2;
L = (b-a)./h; % Dividiendo (a, b) en n subintervalos, el tamaño del paso es h = (b−a)/n

for i=1:6
  [t y] = euler(dy,[a b],y0,L(i));
  y_euler(i) = y(t==2);

  [t y] = rk2(dy,[a b],y0,L(i));
  y_rk2(i) = y(t==2);

  [t y] = rk4(dy,[a b],y0,L(i));
  y_rk4(i) = y(t==2);
endfor

[h L y_euler' y_rk2' y_rk4']
