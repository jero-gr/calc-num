function [x,it] = newton(f,df,x0,maxit,tol)
  it = 1;
  while (it <= maxit)
    x = x0 - (f(x0)/df(x0));
    %r = abs(x-x0)/abs(x); % Error relativo
    r = abs(x-x0); % Error absoluto

    if (r < tol)
        break;
    endif
    x0 = x;
    it = it+1;
  endwhile

  if (it == maxit)
    disp(['No converge en ' num2str(maxit) ' iteraciones.']);
  endif

endfunction

