A = [10 5 0 0;
     5 10 -4 0;
     0 -4 8 -1;
     0 0 -1 5];

delta_w = 0.01;
min_w = 1;
max_w = 2;

rho_w = [];
for i=min_w:delta_w:max_w
  rho_w = [rho_w max(abs(eig(sor_T(A,i))))];
endfor

w=min_w:delta_w:max_w;
rho_min = w(rho_w == min(rho_w));
