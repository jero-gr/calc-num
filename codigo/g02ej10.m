A = [60 30 20;
     30 20 15;
     20 15 12];

L = cholesky(A);

L*L' - A;