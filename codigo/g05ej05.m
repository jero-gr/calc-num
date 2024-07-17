## a)
f = @(x) sin(2*pi.*x);
x = -1:0.1:1;
y = f(x);

## Lagrange
figure(1);
plot(x,y,"xr");
hold on;

p = lagrange(x,y);
x_1 = -1:0.01:1;
y_1 = polyval(p,x_1);
plot(x_1,y_1,"b");


## Spline cubico natural
figure(2);
plot(x,y,"xr");
hold on;

abcd=cubic_spline_natural(x,y);
for i=1:length(x)-1
  a = abcd(i,1);
  b = abcd(i,2);
  c = abcd(i,3);
  d = abcd(i,4);
  x_2 = x(i):0.01:x(i+1);
  y_2 = a + b*(x_2-x_2(1)) + c * (x_2-x_2(1)).^2 + d * (x_2-x_2(1)).^3;
  plot(x_2,y_2,"b");
endfor



## b)
f = @(x) sin(2*pi.*x);
x = -1:0.1:1;
i = 1:21;
perturbacion = (-1).^i * 1e-4;
y = f(x) + perturbacion;

## Lagrange
p = lagrange(x,y);
x_1 = -1:0.01:1;
y_1 = polyval(p,x_1);
figure(1);
plot(x_1,y_1,"g");


## Spline cubico natural
abcd=cubic_spline_natural(x,y);
figure(2);
for i=1:length(x)-1
  a = abcd(i,1);
  b = abcd(i,2);
  c = abcd(i,3);
  d = abcd(i,4);
  x_2 = x(i):0.01:x(i+1);
  y_2 = a + b*(x_2-x_2(1)) + c * (x_2-x_2(1)).^2 + d * (x_2-x_2(1)).^3;
  plot(x_2,y_2,"g");
endfor


