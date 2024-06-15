#Ejercicio 1
#Guia 6

clear all;clc

f=@(x) exp(x) - (2*(x.^2)) + (3*x) -1;
df=@(x) exp(x) - (4*x) + 3;
ddf=@(x) exp(x) -4;

x0=0.0

exp_min = -11;
exp_max = -1;
x=linspace(-1,5,201);

figure(1)
plot(x,f(x),'b-')
hold on
plot(x0,f(x0),'ro')
grid on
grid minor
xlabel('X')
ylabel('f(x)')
title('Grafica de la funcion')

[dx, h]=aprox_dx_2PP(f, x0, exp_min, exp_max);

df(x0) % valor real o analitico
Error=abs((df(x0) - dx));

expo=[exp_min:exp_max];
h = 10.^expo;
figure(2)
%semilogy(h,Error,'b-*')
loglog(h,Error,'b-*')
xlabel('h')
ylabel('Error')
title('Grafica del Error en funcion de "h"')
grid on
grid minor
