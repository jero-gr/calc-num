f = @(x) 20*x - (x.^3)/5;
df = @(x) 20 - (3/5)*(x.^2);
g = @(x) 2 * pi * f(x) .* sqrt(1 + df(x).^2);

a = 0;
b = 2;
L = 1;
n = 3;

Q_gauss = cuad_gauss_c(g,a,b,L,n)
Q_simp = intNCcompuesta(g,a,b,L,3)

L = 5;
Q_trap5 = intNCcompuesta(g,a,b,L,2)
Q_simp5 = intNCcompuesta(g,a,b,L,3)

Q_quad = quad(g,a,b)


