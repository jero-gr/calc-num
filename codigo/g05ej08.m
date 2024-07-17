x = 0:6;
y = [432 599 1012 1909 2977 4190 5961];

t = x(1):0.1:x(end);

figure(1);
  plot(x,y,"xr");
  hold on;

# a)
  p_6 = polyfit(x,y,6);
  y_6 = polyval(p_6,t);
  plot(t,y_6);

# b)
  p_1 = polyfit(x,y,1);
  y_1 = polyval(p_1,t);
  plot(t,y_1);

# c)
  p_2 = polyfit(x,y,2);
  y_2 = polyval(p_2,t);
  plot(t,y_2);

# d)
  ecm_6 = mean((y - polyval(p_6,x)).^2);
  ecm_1 = mean((y - polyval(p_1,x)).^2);
  ecm_2 = mean((y - polyval(p_2,x)).^2);

# e)
x_e = 0:11;
t_e = x_e(1):0.1:x_e(end);

figure(2);
  plot(x,y,"xr");
  hold on;

    y_6_e = polyval(p_6,t_e);
    plot(t_e,y_6_e);

    y_1_e = polyval(p_1,t_e);
    plot(t_e,y_1_e);

    y_2_e = polyval(p_2,t_e);
    plot(t_e,y_2_e);

# f)
