function p = lagrange(x,y)
  n = length(x);
  p = zeros(1, n); % Inicializa el vector de coeficientes del polinomio

  % Construir el polinomio de Lagrange
  for i = 1:n
    % Iniciar el término de Lagrange como 1
    Li = 1;

    % Multiplicar por todos los términos (x - x_j) / (x_i - x_j) para j != i
    for j = 1:n
      if i != j
        Li = conv(Li, [1, -x(j)]) / (x(i) - x(j));
      end
    end

    % Añadir el término actual multiplicado por y(i) al polinomio total
    p = p + y(i) * Li;
end
