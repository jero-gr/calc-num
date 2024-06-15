#Ejercicio 9
#Guia 6

clear all;clc

#Aproxime el valor de la siguiente integral usando cuadratura de Gauss con n=2
f=@(x) (x.^2) .* exp(-x);

#el resultado analitico de la integral es: 0.16060

a=0;
b=1;
n=2;
L=1;

Q2=cuad_gauss_c(f,a,b,L,n);
Q2

#Compare este resultado con el valor exacto de la integral y
#con aquel obtenido mediante la regla de Newton-Cotes que utiliza igual cantidad de puntos de
#integracion.


analitico = 0.16060;

Q = intNCCompuesta(f,0,1,1,2)

#usando simpson
IS = intNCCompuesta(f,0,1,1,3)

#error simpson:
ES = abs(analitico - IS)/analitico

#error gauss
EQ = abs(analitico - Q2)/analitico


#Repita el ejercicio con n=3.
Q3=cuad_gauss_c(f,a,b,L,3);
Q3

