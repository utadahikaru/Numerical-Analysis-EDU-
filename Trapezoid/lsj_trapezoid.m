function T=lsj_trapezoid(f,a,b,tol,maxit)
%数值积分的复化梯形算法

T=zeros(maxit,1);             %
T(1)=0.5*(b-a)*(f(a)+f(b));   %
T(2)=0.25*(b-a)*(f(a)+2*f(a+b)/2+f(b)); %
k=2;                          %
h=0.5*(b-a);                  %
while abs(T(k)-T(k-1))>tol && k<maxit    %
    k=k+1;h=h/2;                         %
    for i=a:h:(b-h)                      %
           T(k)=T(k)+0.5*h*(f(i)+f(i+h)); %
    end                                   %
end                                       %
T=T(1:k);                                %remove zeros
          