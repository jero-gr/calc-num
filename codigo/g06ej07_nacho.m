#Ejercicio 7
#Guia 6

clear all;clc

x=[0 200 400 600 800 1000 1200]';
p=[4 3.95 3.89 3.80 3.60 3.41 3.30]';
A=[100 103 106 110 120 133 149.6]';

#hago esto para ponerlo en kg, pero se puede no hacer
rho=p/1000;


#Inciso A): calcular la masa total de la barra

#---------------------------------------------------------------------------------------------------------
#Inciso B):
#Determine la precision del calculo del item anterior. Para ello, compare los resultados obtenidos
#usando las funciones del ejercicio 6, realizando una diferencia relativa.

#funcion de integracion
m=rho.*A;

Mt = trapcomp(x,m)
Ms = simpsoncomp(x,m)

dif_rel = (Mt-Ms)/Ms

#usar trapz(x,y) que es una funcion de octave que calcula la trapezoidal. Sirve para corroborar.
