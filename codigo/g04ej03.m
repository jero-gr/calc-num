g_1 = @(x) (3+x-2*x^2)^(1/4);
g_2 = @(x) sqrt(0.5 * (x+3-x^4));
g_3 = @(x) sqrt((x+3)/(x^2+2));
g_4 = @(x) (3*x^4+2*x^2+3)/(4*x^3+4*x-1);

alpha_a = 1;
alpha_b = 3/2;

## Inciso a ##
if ((g_1(alpha_a)-alpha_a * g_1(alpha_b)-alpha_b) < 0)
  disp('alpha es solución de g_1.');
else
  disp('alpha no es solución de g_1.');
endif

if ((g_2(alpha_a)-alpha_a * g_2(alpha_b)-alpha_b) < 0)
  disp('alpha es solución de g_2.');
else
  disp('alpha no es solución de g_2.');
endif

if ((g_3(alpha_a)-alpha_a * g_3(alpha_b)-alpha_b) < 0)
  disp('alpha es solución de g_3.');
else
  disp('alpha no es solución de g_3.');
endif

if ((g_4(alpha_a)-alpha_a * g_4(alpha_b)-alpha_b) < 0)
  disp('alpha es solución de g_4.');
else
  disp('alpha no es solución de g_4.');
endif


## Inciso b ##
[x1,it1] = puntofijo(g_1,1,100,1e-3);
[x2,it2] = puntofijo(g_2,1,100,1e-3);
[x3,it3] = puntofijo(g_3,1,100,1e-3);
[x4,it4] = puntofijo(g_4,1,100,1e-3);
