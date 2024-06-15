#### INCOMPLETO ####

a = 0.401;
b = 42.7e-6;
N = 1000;
k = 1.3806503e-23;
T = 300;
p = 3.5e+7;

tol = 1e-12;

f = @(V) (p + a * (N./V).^2) .* (V - N*b) - (k*N*T);

V = 0.001:0.001:1;
plot(V,f(V));

## Bisección
a = 0;
b = 1;
maxit = round(log2(abs(b-a)/tol))+1;
[x_b,it_b] = biseccion(f,a,b,maxit,tol);
