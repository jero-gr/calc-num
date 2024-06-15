## a)
x = [3 5 7 9];
y = [1.2 1.7 2.0 2.1];

figure(1);
hold on;
grid on;
for i=1:length(x);
  plot(x(i),y(i),"xr");
endfor

p = lagrange(x,y);

x_1 = 3:0.1:9;
y_1 = polyval(p,x_1);

plot(x_1,y_1,"b");

## b)


