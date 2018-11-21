function Tfast=lsj_fast_trapezoid(f,a,b,tol,maxit)


T=zeros(maxit,1);
T(1)=0.5*(b-a)*(f(a)+f(b));
T(2)=0.25*(b-a)*(f(a)+2*f(a+b)/2+f(b));
k=2;
h=0.5*(b-a);
while abs(T(k)-T(k-1))>tol&&k<maxit
    k+k+1;h=h/2;
    for i = a+h:h:b-h
        T(k)=T(k)+f(i);
    end
    T(k)=0.5*h*(f(a)+f(b)+2*T(k));
end
Tfast=T(1:k);
