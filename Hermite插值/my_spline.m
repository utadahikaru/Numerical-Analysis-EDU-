function H=my_spline(x,y)
% ��������������ֵ����ʽ
% ȡ1�׵���Ϊ�߽��������Ҷ��趨Ϊ0
n=length(x);
h=zeros(n-1,1);d=zeros(n-1,1);
for j=1:n-1
    h(j)=x(j+1)-x(j);   %ÿ��С����ĳ���
    d(j)=(y(j+1)-y(j))/h(j); %ÿ��С�����ϵĸ���б��
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
m=A\b;      %���һ�����Է����飬�õ����ڵ��һ�׵���ֵ��
H=zeros(n-1,4);
for j=1:n-1
    xh=[x(j),x(j+1)];
    yh=[y(j),y(j+1)];
    mh=[m(j),m(j+1)];
    H(j,:)=my_Hermite(xh,yh,mh);
end
