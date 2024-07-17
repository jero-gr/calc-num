function I = trapcomp(x, y)
  % trapcomp: Calcula la integral aproximada usando la regla del trapecio compuesta
  % I = trapcomp(x, y) toma dos vectores x e y y calcula la integral de y respecto a x

  % Verificar que x y y tengan la misma longitud
  if length(x) != length(y)
    error('Los vectores x e y deben tener la misma longitud.');
  end

  % Inicializar la integral
  I = 0;

  % Aplicar la regla del trapecio compuesta
  for i = 1:(length(x) - 1)
    h = x(i + 1) - x(i);  % Calcular el ancho del subintervalo
    I = I + (h / 2) * (y(i) + y(i + 1));  % Sumar el área del trapecio
  end
end
