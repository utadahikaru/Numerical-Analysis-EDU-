function T=lsj_Romberg(f,a,b,tol,maxit) %
T=zeros(maxit,maxit); %
h=b-a;
T(1,1)=h/2*(b-a)*(f(a)+f(b)); %
T(2,1)=1/2*T(1)+h/2*(f((a+b)/2));
T(2,2)=4/3*T(2,1)-1/3*T(1,1); %
k=2; %
h=h/2; %
while abs(T(k,k)-T(k,k-1))>tol&&k<maxit %
    k=k+1;h=h/2; %
    for i = a+h:h:b-h %
        T(k,1)=T(k,1)+f(i); %
    end %
    T(k,1)=0.5*h*(f(a)+f(b)+2*T(k,1)); %
    for j = 2:k %
    m=4^k; %
    T(k,j)=(m/(m-1))*T(k-1,j+1)-(1/m-1)*T(k-1,j); %
    end %
end %
T=T(1:k,1:k)+1/2;
T(k,1)
end %

