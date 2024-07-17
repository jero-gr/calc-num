A = [3/4 1/6;
     1/4 1/4];

lambda_A = eig(A);
rho_A = max(abs(lambda_A));

% Es convergente porque el radio espectral rho_A es menor a 1
