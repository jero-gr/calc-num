function df = deriv_2p(f,x,h)
  df = (f(x+h) - f(x))/h;
endfunction

