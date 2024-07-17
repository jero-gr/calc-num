#Ejercicio 5
#Guia 6

clear all;clc

#TABLA 1
f1=@(x) sin(x*pi);
a1=0;
b1=5;
I1 = 2/pi; #valor exacto de la integral
resulint = integral(f1,a1,b1); #formula para sacar el valor exacto de la integral


Tabla1=[];


#h = 1./(2.^(1:12));
#L = (b1-a1)./h(1:12);
#si uso linea 17 y 18, entonces tengo que comentar linea 27, en linea 26 sacar el L y ademas poner en Q1T y Q1S L(i)

L=20;
for i=1:12
  Q1T = intNCcompuesta(f1,a1,b1,L,2);
  Q1S = intNCcompuesta(f1,a1,b1,L,3);
  Ea= abs([Q1T Q1S]-I1);
  Tabla1= [Tabla1; L Q1T Ea(1) Q1S Ea(2)];
  L*=2; #vamos duplicando el L para obtener mejores resultados
endfor

#en simpson es mas rapido la convergencia


#En la primer columna los L, desps los de trap y su error, y por ultimo simpson y su error
disp("--------------TABLA 1-------------")
Tabla1
