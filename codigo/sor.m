function[x,it,r_h]=sor(A,b,x0,maxit,tol,w)
  x = x0;
  n = length(b);
  it = 0;
  r_h = [];
  y = [];

  while (it < maxit)
    for i=1:n
      y(i) = (1-w)*x(i) + (w*(b(i) - sum(A(i,1:(i-1)).*y(1:(i-1))) - sum(A(i,(i+1):n).*x((i+1):n))))/A(i,i);
    endfor

    r_h = [r_h max(abs(y-x))/max(abs(y))];
    %r_h = [r_h norm(abs(y-x)/abs(y),Inf)];
    x = y;

    it = it+1;

    if (r_h(it) < tol)
      break;
    endif
  endwhile
endfunction
