function x=sust_adelante(A,b)
  n=length(b);
  x=b;

  x(1)=b(1)/A(1,1);

  for i = 2:1:n %i=3
    for j = 1:i-1 %j=1,2
      x(i) = x(i)-A(i,j)*x(j);
    endfor
    x(i) = x(i)/A(i,i);
  endfor

endfunction

