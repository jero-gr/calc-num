x = [0 1 3/2 2];
y = [3 3 13/4 5/3];

figure(1);
hold on;
grid on;
for i=1:length(x);
  plot(x(i),y(i),"xr");
endfor

c = dif_div(x,y);

## Newton: P(x) = \sum_{i=0}^n c_i \mul_{j=0}^{i-1} (x-x_j)

x_1 = 0:0.1:2;
y_1 = newton_poly(c,x,x_1);

plot(x_1,y_1,"b");
