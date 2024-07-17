f = @(x) sin(x)+cos(1+x.^2)-1;
a = 0;
b = 5;
x = a:0.01:b;

plot(x,f(x));
grid on;
hold on;
plot([0 5],[0 0], "r");

tol=1e-10;

## Bisección
a = 1;
b = 2;
maxit = round(log2(abs(b-a)/tol))+1;
[x_b1,it_b1] = biseccion(f,a,b,maxit,tol);
plot(x_b1,f(x_b1),"*g");
disp('Método de la bisección:');
disp(['Raiz 1 con intervalo [' num2str(a) ',' num2str(b) ']: ' num2str(x_b1) ', obtenida en ' num2str(it_b1) ' iteraciones.']);

a = 2;
b = 3;
maxit = round(log2(abs(b-a)/tol))+1;
[x_b2,it_b2] = biseccion(f,a,b,maxit,tol);
plot(x_b2,f(x_b2),"*g");
hold off;
it_btot = it_b1+it_b2;
disp(['Raiz 2 con intervalo [' num2str(a) ',' num2str(b) ']: ' num2str(x_b2) ', obtenida en ' num2str(it_b2) ' iteraciones.']);
disp([num2str(it_btot) ' iteraciones totales.']);
disp(' ');


## Newton-Raphson
df = @(x) cos(x)-sin(1+x.^2)*2.*x;
x0 = 2;
maxit=100;
[x_n1,it_n1] = newton(f,df,x0,maxit,tol);
disp('Método de Newton-Raphson:');
disp(['Raiz 1 con x0=' num2str(x0) ': ' num2str(x_n1) ', obtenida en ' num2str(it_n1) ' iteraciones.']);

x0 = 2.5;
[x_n2,it_n2] = newton(f,df,x0,maxit,tol);
disp(['Raiz 2 con x0=' num2str(x0) ': ' num2str(x_n2) ', obtenida en ' num2str(it_n2) ' iteraciones.']);
disp(' ');

## Secante
x_0 = 1;
x_1 = 2;
maxit=100;
[x_s1,it_s1] = secante(f,x_0,x_1,maxit,tol);
disp('Método de la secante:');
disp(['Raiz 1 con intervalo [' num2str(x_0) ',' num2str(x_1) ']: ' num2str(x_s1) ', obtenida en ' num2str(it_s1) ' iteraciones.']);

x_0 = 2;
x_1 = 4;
[x_s2,it_s2] = secante(f,x_0,x_1,maxit,tol);
disp(['Raiz 2 con intervalo [' num2str(x_0) ',' num2str(x_1) ']: ' num2str(x_s2) ', obtenida en ' num2str(it_s2) ' iteraciones.']);

