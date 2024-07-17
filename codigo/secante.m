 function [x,it] = secante(f,x_0,x_1,maxit,tol)
  it = 2;
  q_0 = f(x_0);
  q_1 = f(x_1);

  while (it <= maxit)
    x = x_1 - (q_1*(x_1 - x_0))/(q_1 - q_0);
    if (abs(x-x_1) < tol)
        break;
    endif
    x_0 = x_1;
    q_0 = q_1;
    x_1 = x;
    q_1 = f(x);
    it = it+1;
  endwhile

  if (it == maxit)
    disp(['No converge en ' num2str(maxit) ' iteraciones.']);
  endif

endfunction

