# ---------------------------------------------------------------------------- #
## a)
  f_1 = @(x) sin(pi*x);
  a_1 = 0;
  b_1 = 5;
  F_1 = @(x) -(1/pi) * cos(pi*x);
  L_1 = 1;

  n=2:13;
  F_ab_1 = F_1(b_1) - F_1(a_1);
  for i=1:12
    Q_1(i) = intNCcompuesta(f_1,a_1,b_1,L_1,n(i));
  endfor

  abs(Q_1-F_ab_1)


  f_2 = @(x) 1 ./ (1 + x.^2);
  a_2 = -5;
  b_2 = 5;
  F_2 = @(x) atan(x);
  L_2 = 1;

  n=2:13;
  F_ab_2 = F_2(b_2) - F_2(a_2);
  for i=1:12
    Q_2(i) = intNCcompuesta(f_2,a_2,b_2,L_2,n(i));
  endfor

  abs(Q_2-F_ab_2)
