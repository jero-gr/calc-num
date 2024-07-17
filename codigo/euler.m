function [t,y] = euler(f,inter,y0,L)

t = linspace(inter(1),inter(2),L+1)';
h = (inter(2)-inter(1))/L;

y = zeros(length(y0), L+1);

y(:,1) = y0;
for n = 1:L
    y(:,n+1) = y(:,n) + h*f(t(n),y(:,n));
end

y = y';


