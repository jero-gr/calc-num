A = [1 -1 2 -1;
     0 2 -1 1;
     0 0 -1 -1;
     0 0 0 2];

b = [-8 6 -4 4]'

x_atras = sust_atras(A,b);
A*x_atras - b;

x_adelante = sust_adelante(A',b);
A'*x_adelante - b;
