## Ejercicio 1
  ## a)
    ## Datos
    x = [0.0 0.2 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0];
    y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94];

    figure(1);
      clf;
      plot(x,y,"x","LineWidth",1);
      grid on;
      hold on;

    % f(x) = a_0 + a_1*cos(x * pi/2) + a_2 * cos(x * pi/2).^2
    % g(x) = cos(x * (pi/2));
    % f(g) = a_0 + a_1 * g + a_2 * g.^2;

    g = cos(x * (pi/2));

    figure(2);
      clf;
      plot(g,y,"o","LineWidth",1);
      grid on;
      hold on;

    p_f_g = polyfit(g,y,2);
    f_g = polyval(p_f_g,g);
    f_x = polyval(p_f_g,g);

    figure(2);
      plot(g,f_g,"-","LineWidth",1);

  ## b)
    y(x==1) - polyval(p_f_g,cos(pi/2))


## -------------------------------------------------------------------------
## Ejercicio 2
  % M(x) = E * I * k(x)
  % k(x) = y'' ./ (1 + (y').^2).^(3/2);
  % y(0)=0, y'(0)=0;

  L = 120; % cm
  E = 2.1e6; % kg/cm^2
  I = 4250; % cm^4
  P = 3000;

  % M(x) = P(L-x);
  % E * I * (y'' ./ (1 + (y').^2).^(3/2)) = P .* (L-x);
  % y'' ./ (1 + (y').^2).^(3/2) = (P .* (L-x)) ./ (E * I);
  % y'' = (P .* (L-x) .* (1 + (y').^2).^(3/2)) ./ (E * I);

  ## y_1 = y
  ## y_2 = y'
  ## y_3 = y''

  ## y_1' = y_2
  ## y_2' = (P .* (L-x) .* (1 + (y').^2).^(3/2)) ./ (E * I);

  ## Planteo el vector dY
    dY = @(x,Y) ([ Y(2) ;
                   (P .* (L-x) .* (1 + (Y(2)).^2).^(3/2)) ./ (E * I) ]);

  ## Planteo el vector de condiciones iniciales Y0
    Y0 = [0 0]; % y(0)=0, y'(0)=0;

  ## Defino el intervalo y el salto
    a = 0;
    b = L;
    h = 0.001;
    L_int = (b-a)./h;

  ## Resuelvo
    [x,Y] = rk4(dY,[a b],Y0,L_int);

  ## Grafico
    figure(1);
      clf;
      plot(x,Y(:,1),"LineWidth",1);
      grid on;
      hold on;

    figure(2);
      clf;
      plot(x,Y(:,2),"LineWidth",1);
      grid on;
      hold on;

   x(Y(:,1) == max(Y(:,1)))
   max(Y(:,1))

   min(x(Y(:,2) > 0.0019))

   p_dy = polyfit(x,Y(:,2),2);
   dy = @(x) polyval(p_dy,x) - 0.0019;

   figure(2);
      plot(x,dy(x)+0.0019,"LineWidth",1);

   [x_dy,it] = biseccion(dy,a,b,1000,1e-3);

## -------------------------------------------------------------------------
## Ejercicio 3
  f = @(x) 2 + cos(pi*x);
  df = @(x) - sin(pi*x) * pi;
  g = @(x) 2 * pi * f(x) .* sqrt(1 + df(x).^2);

  a = 0;
  b = 2;
  L = 40;
  n = 3;

  Q_gauss = cuad_gauss_c(g,a,b,L,n)
  Q_quad_ = quad(g,a,b)



