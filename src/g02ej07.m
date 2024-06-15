function [M, b] = Ejercicio7(n)
  M=zeros(n);
  b=zeros(n,1) + 1/n^2;

  M(1,1)=1;
  M(n,n)=1;

  b(1)=0;
  b(n)=0;

  for i=2:n-1
    M(i,i)=2;
    M(i,i-1)=-1;
    M(i,i+1)=-1;
  endfor

  %x = gauss(M,b);

  %t=[0:1/99:1];

  %plot(t,x');

endfunction
