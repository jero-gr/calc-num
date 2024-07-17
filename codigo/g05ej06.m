x = [1 2 3];
f = [0 4 22/3];
df = [3 3];

figure(1);
plot(x,f,"xr");
hold on;

abcd = cubic_spline_clamped(x,f,df(1),df(2));

for i=1:length(x)-1
  a = abcd(i,1);
  b = abcd(i,2);
  c = abcd(i,3);
  d = abcd(i,4);
  x_2 = x(i):0.01:x(i+1);
  y_2 = a + b*(x_2-x_2(1)) + c * (x_2-x_2(1)).^2 + d * (x_2-x_2(1)).^3;
  plot(x_2,y_2,"b");
endfor
