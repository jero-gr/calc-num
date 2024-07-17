function [T] = gauss_seidel_T(A)
  D_s = diag(diag(A));
  L_s = tril(A,-1);
  U_s = triu(A,1);
  T = - inv(D_s+L_s)*U_s;
endfunction

