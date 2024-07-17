function [c,Q] = dif_div(x,y)
  n = length(x);
  Q = zeros(n,n);

  Q(:,1) = y;

  c(1) = Q(1,1);

  for j=2:n
    for i=j:n
      Q(i,j) = (Q(i,j-1) - Q(i-1,j-1))/(x(i)-x(i-j+1));
    endfor
    c(j) = Q(j,j);
  endfor

endfunction

