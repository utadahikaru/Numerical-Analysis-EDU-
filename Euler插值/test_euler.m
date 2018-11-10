function test_euler %
format long
f=@(x,y) x+y
a=0;b=1;
h=0.2;
initial=1;
lsj_euler(f,h,a,b,initial);
hold on;
lsj_euler_mk2(f,h,a,b,initial);
hold on;
x=a:h:b;
plot(x,-x-1+2*exp(x));
-x-1+2*exp(x)
legend('Euler Algorithm','Euler Algorithm MKII','Original Function')