function [T] = sor_T(A,w)
  D_s = diag(diag(A));
  L_s = tril(A,-1);
  U_s = triu(A,1);
  T = - inv(D_s+w*L_s) * ((1-w)*D_s-w*U_s);
endfunction
