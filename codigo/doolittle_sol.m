function [x] = doolittle_sol(L,U,b)
  y = sust_adelante(L,b);
  x = sust_atras(U,y);
endfunction

