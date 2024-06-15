dy = @(t,y) t .* e.^(3*t) - 2*y;
dydy = @(t,y) -2;

y0 = 0;
a = 0;
b = 1;

y_ex = @(t) (1/5) * t .* e.^(3*t) - (1/25) * e.^(3*t) + (1/25) * e.^(-2*t);

h = [0.2 0.1 0.05]';
L = (b-a)./h;

disp('Para h=0.2');
disp('t     y_CN      y_eu      y_ex');
[t_CN, y_CN] = CN_newton(dy,dydy,a,b,y0,L(3));
[t_eu_atr, y_eu_atr] = euler_atras(dy,dydy,a,b,y0,L(3));
[t_eu_ade, y_eu_ade] = euler(dy,[a b],y0,L(3));

t = t_CN;

[t y_CN y_eu_atr y_eu_ade y_ex(t)]

plot(t,y_CN);
hold on;
plot(t,y_eu_atr);
plot(t,y_eu_ade);
plot(t,y_ex(t),"--",'LineWidth',1.5);
