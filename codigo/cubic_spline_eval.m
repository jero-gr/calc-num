function [T,P] = cubic_spline_eval(abcd,x,T_m)

  T = [];
  P = [];

  for i=1:length(x)-1
    a = abcd(i,1);
    b = abcd(i,2);
    c = abcd(i,3);
    d = abcd(i,4);

    t = x(i):T_m:x(i+1)-T_m;
    p = a + b*(t-t(1)) + c * (t-t(1)).^2 + d * (t-t(1)).^3;

    T = [T t];
    P = [P p];
  endfor

endfunction

