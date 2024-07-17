function P = newton_poly(c,x,x_var)

  P = c(1);
  n = length(x);

  for i=2:n

    mul = 1;

    for j=1:i-1
      mul = mul .* (x_var - x(j));
    endfor

    P = P + c(i) * mul;

  endfor

endfunction
