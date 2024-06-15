E = @(t) ((t+1/3).^3 + 1/3) .* e.^(-t);
tol = 1e-5;
t=0:0.01:10;
plot(t,E(t));
grid on;
hold on;

## a)
  disp('a)');
  E_a = @(t) ((t+1/3).^3 + 1/3) .* e.^(-t) - 1.5;
  plot([0 10],[1.5 1.5], "g");

  # Bisección
    disp('Método de la bisección:');
    a = 1;
    b = 2;
    maxit = round(log2(abs(b-a)/tol))+1;
    tic();
    [x_b1,it_b1] = biseccion(E_a,a,b,maxit,tol);
    tiempo=toc();
    disp(['E(t)=1.5 en: ' num2str(x_b1) ', obtenida en ' num2str(it_b1) ' iteraciones y ' num2str(tiempo) ' s.']);

    a = 3.5;
    b = 4.5;
    maxit = round(log2(abs(b-a)/tol))+1;
    tic();
    [x_b2,it_b2] = biseccion(E_a,a,b,maxit,tol);
    tiempo=toc();
    disp(['E(t)=1.5 en: ' num2str(x_b2) ', obtenida en ' num2str(it_b2) ' iteraciones y ' num2str(tiempo) ' s.']);
    disp(' ');

  # Secante
    x_0 = 1;
    x_1 = 2;
    maxit=100;
    tic();
    [x_s1,it_s1] = secante(E_a,x_0,x_1,maxit,tol);
    tiempo=toc();
    disp('Método de la secante:');
    disp(['E(t)=1.5 en: ' num2str(x_s1) ', obtenida en ' num2str(it_s1) ' iteraciones y ' num2str(tiempo) ' s.']);

    x_0 = 3.5;
    x_1 = 4.5;
    tic();
    [x_s2,it_s2] = secante(E_a,x_0,x_1,maxit,tol);
    tiempo=toc();
    disp(['E(t)=1.5 en: ' num2str(x_s2) ', obtenida en ' num2str(it_s2) ' iteraciones y ' num2str(tiempo) ' s.']);

  # Ploteo
    plot(x_s1,1.5,"*g");
    plot(x_s2,1.5,"*g");


## b)


hold off;
