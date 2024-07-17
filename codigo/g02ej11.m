A = [1  1+0.5e-15 3;
     2      2     20;
     3      6     4];

b = zeros(length(A),1);

[L,U] = doolittle(A,b);
[L_p,U_p,r_p] = doolittle_p(A,b);

Res = A - L*U;
Res_p = A(r_p,:) - L_p*U_p;
