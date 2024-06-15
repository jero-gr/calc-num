f = @(x) x .* (log(x+3)-17) - 1;
df = @(x) x./(x+3) + log(x+3) - 17;

a=0;
b=1;

while(f(a)*f(b)>0)
b=2*b;
endwhile

tol_b = 1e2;
maxit_b = round(log2(abs(b-a)/tol_b))+1;
[x_b,it_b] = biseccion(f,a,b,maxit_b,tol_b);

tol_n = 1e-12;
maxit_n = 1000;
[x_n,it_n] = newton(f,df,x0,maxit_n,tol_n);
