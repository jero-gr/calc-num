## b)
x = [0 1 2 3];
f = [0 2 3 4];

[a,b,c,d]=cubic_spline_natural(x,f);

[a(1:end-1) b c(1:end-1) d]

## c)
x = [0 1 2];
f_2 = -10:0.1:10;

for i = 1:length(f_2);
  f = [1 2 f_2(i)];
  [a,b,c,d]=cubic_spline_natural(x,f);
  err(i) = (abs(a(1)-1) + abs(b(1)-2) + abs(c(1)) + abs(d(1)+1));
endfor

##plot(f_2,err);

  f = [1 2 -1];
  [a,b,c,d]=cubic_spline_natural(x,f);
  [a(1:end-1) b c(1:end-1) d]

  # b=-1, c=-3, d=1
