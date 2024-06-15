x_1=[0 2 6];
y_1=[0 4 6];
t_1=[0 1 2];

x_2=[6 3 0];
y_2=[6 2 0];
t_2=[0 1 2];

figure(1);
plot(x_1,y_1,"or");
hold on;
plot(x_2,y_2,"or");

##coef_1 = cubic_spline_clamped(x_1,y_1,0,0);
##coef_2 = cubic_spline_clamped(flip(x_2),flip(y_2),0,0);
##
##figure(1);
##[T_1,P_1] = cubic_spline_eval(coef_1,x_1,0.1);
##plot(T_1,P_1,"b");
##
##figure(2);
##[T_2,P_2] = cubic_spline_eval(coef_2,flip(x_2),0.1);
##plot(T_2,P_2,"b");

##coef_x1 = cubic_spline_clamped(t_1,x_1,0,0);
##coef_y1 = cubic_spline_clamped(t_1,y_1,0,0);
##[T_x1,P_x1] = cubic_spline_eval(coef_x1,t_1,0.1);
##[T_y1,P_y1] = cubic_spline_eval(coef_y1,t_1,0.1);
##
##figure(1);
##plot(P_x1,P_y1,"b");
##
##coef_x2 = cubic_spline_clamped(t_2,x_2,0,0);
##coef_y2 = cubic_spline_clamped(t_2,y_2,0,0);
##[T_x2,P_x2] = cubic_spline_eval(coef_x2,t_2,0.1);
##[T_y2,P_y2] = cubic_spline_eval(coef_y2,t_2,0.1);
##
##figure(1);
##plot(P_x2,P_y2,"b");
##
##figure(2);
##plot([T_x1 T_x1(end)+T_x2],[P_x1 P_x2]);
##
##figure(3);
##plot([T_y1 T_y1(end)+T_y2],[P_y1 P_y2]);



[x_a,dx_a,ddx_a]=funcion_spline(t_1,x_1,0,0);
[y_a,dy_a,ddy_a]=funcion_spline(t_1,y_1,0,0);

[x_b,dx_b,ddx_b]=funcion_spline(t_2,x_2,0,0);
[y_b,dy_b,ddy_b]=funcion_spline(t_2,y_2,0,0);

t=0:0.1:2;
plot(x_a(t),y_a(t),'LineWidth',1.5);
plot(x_b(t),y_b(t),'LineWidth',1.5);

plot(dx_a(t),dy_a(t),'--','LineWidth',1);
plot(dx_b(t),dy_b(t),'--','LineWidth',1);

# t=5.5 -> t=2.5 de las funciones b
vx = dx_b(2.5)
vy = dy_b(2.5)

