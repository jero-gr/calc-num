x = [-1 0 1 2];
y = [-1.1 -0.4 -0.9 -2.7];

ln_y = log(-y);
p_2 = polyfit(x,ln_y,2);

t = -1.5:0.1:2.5;
y_p_2 = polyval(p_2,t);
y_p_2 = -e.^(y_p_2);

plot(x,y,"xr");
hold on;
plot(t,y_p_2);


