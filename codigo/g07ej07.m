## Planteo los vectores dX y X
dX = @(t,X) ([ -t.*X(2); t.*X(1)-t.*X(2) ]);
X0 = [1 -1];

## Defino el intervalo y el salto
a = 0;
b = 20;
h = 0.05;
L = (b-a)./h;

## Resuelvo
[t,X] = euler(dX,[a b],X0,L);

## Ploteo
plot(X(:,1),X(:,2));


