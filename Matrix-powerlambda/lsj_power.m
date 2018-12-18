function [lambda key]=lsj_power(A,tol,maxit)%
n=length(A);%
x=ones(n,1);%
c=(x'*A*x)/(x'*x);%
key(1)=c;%
x=A*x;%
d=(x'*A*x)/(x'*x);%
key(2)=d;
k=2;%
while abs(c-d)>tol&&k<maxit%
k=k+1;%
x=A*x;%
x=x/max(abs(x));%
c=d;%
d=(x'*A*x)/(x'*x); 
key(k+1)=d;%
end%
lambda=d;% 
end%