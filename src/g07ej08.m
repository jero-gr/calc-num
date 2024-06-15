## x_2 disminuye cuando x_1 es cero, entonces x_2 es depredador y x_1 es presa

## Planteo los vectores dX y X
dX = @(t,X) ([ X(1).*(3-0.002.*X(2)); -X(2).*(0.5-0.0006.*X(1))]);
X0 = [1600 800];

## Defino el intervalo y el salto
a = 0;
b = 12;
h = 0.1;
L = (b-a)./h;

## Resuelvo
[t,X] = euler(dX,[a b],X0,L);

## Ploteo
plot(t,X(:,2),'LineWidth',1.5);
hold on;
plot(t,X(:,1),'LineWidth',1.5);
