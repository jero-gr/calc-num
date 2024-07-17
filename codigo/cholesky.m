function [c]=cholesky(A)
  n=length(A);
  a=A;
  c=zeros(n);

  c(1,1)=sqrt(a(1,1));

  for i = 2:n
    c(i,1)=a(i,1)/c(1,1);
  endfor

  for i = 2:n-1

    c(i,i) = sqrt( a(i,i) - sum(c(i,1:i-1).^2) );

    for j = i+1:n
      c(j,i) = (a(j,i) - sum( c(j,1:i-1).*c(i,1:i-1) ))/c(i,i);
    endfor

  endfor

  c(n,n) = sqrt( a(n,n) - sum(c(n,1:n-1).^2) );

endfunction

