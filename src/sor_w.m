function [w_rho_min] = sor_w(A,delta_w,min_w,max_w)
  rho_w = [];

  for i=min_w:delta_w:max_w
    rho_w = [rho_w max(abs(eig(sor_T(A,i))))];
  endfor

  w=min_w:delta_w:max_w;
  w_rho_min = w(rho_w == min(rho_w)); % w_rho_min es el valor de w que minimiza el radio espectral
endfunction
