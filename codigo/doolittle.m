function [L,U] = doolittle(A,b)
  n=length(b);
  A = [A b];
  L=zeros(n);
  % Eliminacion

  for k=1:n-1
    for i=k+1:n
      m = A(i,k)/A(k,k);
      L(i,k)=m;
      A(i,k)=0;
      for j=k+1:n+1
        A(i,j) = A(i,j)-m*A(k,j);
      endfor
    endfor
    L(k,k)=1;
  endfor

  L(n,n)=1;

  if (A(n,n)==0)
    disp('no hay sol. unica');
  endif

  U=A(1:n,1:n);
endfunction

