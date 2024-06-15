v = load('datos_velocidades.txt');
t = [0:0.2:5]';

# a)
  A = [sin(2*t), t .^ 2, 2 .^ t, ones(length(t),1)];
  c = gauss((A' * A),(A' * v));
  v_aprox = @(t) c(1)*sin(2*t) + c(2) * t .^ 2 + c(3) * 2 .^ t + c(4);

  figure(1);
    plot(t,v,"xr");
    hold on;
    t_aprox = 0:0.01:6;
    plot(t_aprox,v_aprox(t_aprox));

# b)
  p_6 = polyfit(t,v,6);
  v_p_6 = polyval(p_6,t_aprox);

  figure(1);
    plot(t_aprox,v_p_6);

  vel_6h = polyval(p_6,6);

# c)
  ecm_a = mean((v - v_aprox(t)).^2);
  ecm_6 = mean((v - polyval(p_6,t)).^2);
