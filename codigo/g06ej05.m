h = 1 ./ (2.^[1:12]');

## a)
  # definir variables y funciones
  f = @(x) sin(x*pi); % Función f
  F = @(x) -1/pi * cos(x*pi); % Antiderivada de f

  a = 0;
  b = 5;
  F_ab = F(b) - F(a); % Integral definida de f en [a,b]

  L = (b-a)./h; % L se obtiene de la igualdad h=(b-a)/L

  for i=1:length(h)
    Q_2(i) = intNCcompuesta(f,a,b,L(i),2); % Regla de los trapecios
    Q_3(i) = intNCcompuesta(f,a,b,L(i),3); % Regla de Simpson
  endfor

  E_trap = abs(F_ab - Q_2'); % Error de aproximación de Q_2
  E_simp = abs(F_ab - Q_3'); % Error de aproximación de Q_3

  [h L Q_2' E_trap Q_3' E_simp] % Mostrar tabla


