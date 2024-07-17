## Inciso b ##
g_1 = @(x) 0.5 * sqrt(10-x^3);
g_2 = @(x) sqrt(10/(4+x));
x0 = 1.5;
tol = 1e-3;

[x1,p_vec1] = puntofijo(g_1,x0,100,tol);
[x2,p_vec2] = puntofijo(g_2,x0,100,tol);
