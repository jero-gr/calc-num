#Ejercicio 10
#Guia 6

clear all;clc

f=@(x) 20*x - ((x.^3)/5);
df=@(x) 20 - ((3*x.^2)/5);

F =@(x) 2*pi*f(x).*sqrt(1 + df(x).^2);

x=linspace(0,2,20);
a=0;
b=2;

#cuadratura de Gauss para n=3, y comparar con la regla de simpson.
Qgauss=cuad_gauss_c(F,a,b,1,3)

s = simpson(F,a,b)

#Ahora resolver usando la regla del trapecio y simpson COMPUESTA, para L=5;
#comparar los resultados con la aproximacion que se obtiene de usar la funcion quad()

#simp_comp1 = simpsoncomp(x,F)

simp_comp = intNCCompuesta(F,a,b,5,3)

#trap_comp1 = trapcomp(x, F)

trap_comp = intNCCompuesta(F,a,b,5,2)

quad1=quad(F,a,b)

disp('============================================')
disp('Figura 1: Grafica de la funcion f(x)')
figure(1)
fx=f(x);
plot(x,fx,'b-')
grid on
grid minor

