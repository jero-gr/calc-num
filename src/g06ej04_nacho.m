#Ejercicio 4
#Guia 6

clear all;clc

#HAY QUE VERIFICAR SI EL ERROR ENTRE LA INTEGRAL Y EL ALGORITMO TIENDE A CERO
# A MEDIDA QUE N CRECE.

#para tabla 1:
f1=@(x) sin(x.*pi);
I1= 2/pi; #este es el valor analitico de la integral

#el intervalo es [0;5]
a=0;
b=5;
err1=[];
xa=linspace(0,5,201);

#la tabla va de n=2 hasta 13:
for n=2:13
  Q1 = intNCcompuesta(f1,a,b,1,n); #HAY QUE PONER L=1 POR CONSIGNA
  err1=[err1;abs(I1-Q1)]; #CALCULO EL ERROR, OSEA EL VALOR DE LA INTEGRAL EXACTA MENOS EL VALOR DE LA INTEGRAL PARA CADA N
  subplot(2,1,1)
  xia=linspace(0,5,n);
  plot(xa,f1(xa),xa,polyval(polyfit(xia,f1(xia),n-1),xa)),grid
endfor

disp("Error de la tabla 1")
err1

disp("")


#para tabla 2:
f2=@(x) 1./(1+(x.^2));
I2= atan(5) - atan(-5); #este es el valor analitico de la integral

#el intervalo es [-5;5]
a2=-5;
b2=5;
err2=[];
xb=linspace(-5,5,201);

#la tabla va de n=2 hasta 13:
for n=2:13
  Q2 = intNCcompuesta(f2,a2,b2,1,n); #HAY QUE PONER L=1 POR CONSIGNA
  err2=[err2;abs(I2-Q2)]; #CALCULO EL ERROR, OSEA EL VALOR DE LA INTEGRAL EXACTA MENOS EL VALOR DE LA INTEGRAL PARA CADA N
  subplot(2,1,2)
  xib=linspace(-5,5,n);
  plot(xb,f2(xb),xb,polyval(polyfit(xib,f2(xib),n-1),xb)),grid

endfor

disp("Error de la tabla 2")
err2


#Inciso C)
#no, no es cierto que a medida que aumenta el n el Qn(f,a,b) va a converger a la integral de la funcion para toda funcion f.
