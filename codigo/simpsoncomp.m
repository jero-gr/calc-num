function I = simpsoncomp(x, y)
  % simpsoncomp: Calcula la integral aproximada usando la regla de Simpson compuesta
  % I = simpsoncomp(x, y) toma dos vectores x e y y calcula la integral de y respecto a x
  % Se asume que los x_i están equiespaciados y que la longitud de x e y es impar.

  % Verificar que x y y tengan la misma longitud
  if length(x) != length(y)
    error('Los vectores x e y deben tener la misma longitud.');
  end

  % Verificar que el número de puntos sea impar
  if mod(length(x), 2) == 0
    error('El número de puntos debe ser impar.');
  end

  % Calcular el tamaño del paso (asumiendo que x_i están equiespaciados)
  h = x(2) - x(1);

  % Inicializar la integral
  I = y(1) + y(end);

  % Sumar las contribuciones de los puntos interiores
  for i = 2:2:(length(x) - 1)
    I += 4 * y(i);
  end

  for i = 3:2:(length(x) - 2)
    I += 2 * y(i);
  end

  % Multiplicar por el factor (h/3)
  I = I * (h / 3);
end
