d = @(x) x.^4 + x.^2 - 2.*x + 1;
f = @(x) 4*x.^3 + 2*x - 2;
df = @(x) 8*x.^2 + 2;
tol = 1e-4;
maxit = 100;
x0 = 1;
t=-2:0.1:2;

plot(t,t.^2);
hold on;
grid on;
axis([-2 2 0 4]);
plot(t,d(t));

[x,it] = newton(f,df,x0,maxit,tol)
