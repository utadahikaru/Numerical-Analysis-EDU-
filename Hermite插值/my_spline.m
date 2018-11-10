function H=my_spline(x,y)
% 计算三次样条插值多项式
% 取1阶导数为边界条件，且都设定为0
n=length(x);
h=zeros(n-1,1);d=zeros(n-1,1);
for j=1:n-1
    h(j)=x(j+1)-x(j);   %每个小区间的长度
    d(j)=(y(j+1)-y(j))/h(j); %每个小区间上的割线斜率
end
lambda =zeros(n-2,1);mu=zeros(n-2,1);g=zeros(n-2,1);
for j=1:n-2
    lambda(j)=h(j+1)/(h(j)+h(j+1));
    mu(j)=1-lambda(j);
    g(j)=3*(lambda(j)*d(j)+mu(j)*d(j+1));
end

A=eye(n,n);b=zeros(n,1);
for i = 2:n-1
    A(i,i-1)=lambda(i-1);
    A(i,i)=2;
    A(i,i+1)=mu(i-1);
    b(i)=g(i-1);
end
m=A\b;      %求解一阶线性方程组，得到各节点的一阶导数值。
H=zeros(n-1,4);
for j=1:n-1
    xh=[x(j),x(j+1)];
    yh=[y(j),y(j+1)];
    mh=[m(j),m(j+1)];
    H(j,:)=my_Hermite(xh,yh,mh);
end
