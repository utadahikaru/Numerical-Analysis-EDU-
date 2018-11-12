function H3=lsj_Hermite(x,y,m) %Hermite函数的定义

h=x(2)-x(1);
p=[1,-2*x(2),x(2)^2];
q=[1,-2*x(1),x(1)^2];

H3=conv(p,[2,h-2*x(1)])*y(1)/h+...
    conv(p,[1,-x(1)])*m(1)+...
    conv(q,[-2,h+2*x(2)])*y(2)/h+...
    conv(q,[1,-x(2)])*m(2);

H3=H3/h^2;
end