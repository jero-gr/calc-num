## Inciso a) ##
a = -2;
b = 1.5;
t = a:0.01:b;
f = @(x) 3.*(x+1).*(x-0.5).*(x-1);

plot(t,f(t));
grid on;
hold on;
plot([-2 1.5],[0 0],"r");

% Iteración 1
x1 = a + (b-a)/2;
if (f(a)*f(x1)>0)
  a = x1;
else
  b = x1;
endif
plot(x1,0,"*");

% Iteración 2
x2 = a + (b-a)/2;
if (f(a)*f(x2)>0)
  a = x2;
else
  b = x2;
endif
plot(x2,0,"*");

% Iteración 3
x3 = a + (b-a)/2;
if (f(a)*f(x3)>0)
  a = x3;
else
  b = x3;
endif
plot(x3,0,"*");

% Iteración 4
x4 = a + (b-a)/2;
if (f(a)*f(x4)>0)
  a = x4;
else
  b = x4;
endif
plot(x4,0,"*");


## Inciso c ##
f = @(x) x.^3 + x - 4;
a = 1;
b = 4;
t = a:0.01:b;

plot(t,f(t));
grid on;
tol = 1e-3;
kmax = round(log2(abs(b-a)/tol))+1;

[x,it] = biseccion(f,a,b,kmax,tol);
