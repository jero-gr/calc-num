t = 4:4:24;
c = [1590 1320 1000 900 650 560];

figure(1);
  plot(t,c,"or");
  hold on;

# a)
  % c = b * e^(-k*t)
  % log(c) = log(b) - k*t
  ln_c = log(c);


  p_1 = polyfit(t,ln_c,1);
  t_1 = 0:0.1:24;

  k=p_1(1);
  b=p_1(2);
  b=e^b;
  y_p_1 = b * e.^(k*t_1);

  y_p_2 = polyval(p_1,t_1);
  y_p_2 = e.^y_p_2;

##  plot(t_1,y_p_1);
  plot(t_1,y_p_2);

# b)
  y_p_2(t_1==0);

# c)
  c_t = @(t_c) b * e.^(k * t_c) - 200;
  t_c = 0:100;

  figure(2);
    plot(t_c,c_t(t_c));
    hold on;

  t_200 = biseccion(c_t,1,100,100,1e-5);

  figure(2);
    plot(t_200,c_t(t_200),"xr");
    hold on;
