[M,b] = Ejercicio7(100);
[L,U] = doolittle(M,b);

M=zeros(n);
b=zeros(n,1);

M(1,1)=1;
M(n,n)=1;

for i=2:n-1
  M(i,i)=2;
  M(i,i-1)=-1;
  M(i,i+1)=-1;
endfor

max_val=zeros(10,1);

for k=1:10
  b(2:n-1) = 1/n^k;
  x = gauss(M,b);
  max_val(k) = max(x);
endfor

semilogy(max_val);
