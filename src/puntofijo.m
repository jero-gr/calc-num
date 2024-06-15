function [x,it] = puntofijo(g,x0,maxit,tol)
  it = 1;

  while (it <= maxit)
    x = g(x0);

    if (abs(x-x0) < tol)
      break;
    endif

    x0 = x;
    it = it+1;
  endwhile

  if (it == maxit)
    disp(['No converge en ' num2str(maxit) ' iteraciones.']);
  endif

endfunction

