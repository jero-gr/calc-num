% c*v = g*m*(1 - e^(-(c/m)*t))
% g*m*(1 - e^(-(c/m)*t)) - c*v = 0

disp("Ejercicio 1:");
format long;

# a)
  g = 9.8;  % g = 9.8 m/s^2
  c = 15;   % c = 15 kg/s
  t = 5;    % t = 5 s
  v = 35;   % v = 35 m/s

  f_a = @(m) g .* m .* (1 - e.^(-(c./m)*t)) - c*v;

  m = 0:1:200;

  figure(1);
  plot(m,f_a(m));
  grid on;
  hold on;

  a = 100;
  b = 150;
  maxit = 100;
  tol = 1e-6;
  [m_ans,it] = biseccion(f_a,a,b,maxit,tol);
  disp("a)");
  m_ans
  plot(m_ans,f_a(m_ans),"*r");

# b)
  m = 110;  % m = 110 kg

  f_b = @(c) g * m * (1 - e.^(-(c/m)*t)) - c*v;
  c = 0:1:100;

  figure(2);
  plot(c,f_b(c));
  grid on;
  hold on;

  a = 10;
  b = 20;
  maxit = 100;
  tol = 1e-6;
  disp(" ");
  disp("b)");
  [c_ans,it] = biseccion(f_b,a,b,maxit,tol);
  c_ans
  plot(c_ans,f_b(c_ans),"*r");
