function [x,it] = biseccion(f,a,b,maxit,tol)
  it = 1;
  x0 = 0;

  while (it <= maxit)
    x = a+(b-a)/2;
    %r = abs(x-x0)/abs(x); % Error relativo
    r = abs(x-x0); % Error absoluto

    if (r < tol)
      break
    endif

    if ((f(a)*f(x)) > 0)
      a = x;
    else
      b = x;
    endif;

    x0 = x;
    it = it+1;
  endwhile

  if (it > maxit)
    disp(['No se halló la raíz en ' num2str(maxit) ' iteraciones.']);
##    x = [];
  endif

endfunction

