function ex_FormulaGroup %
A=[ 1 3 6 8 9 2; 2 5 3 1 6 3; 3 6 1 2 8 5; 2 6 8 9 3 8; 5 8 9 3 2 3;
3 5 8 1 7 2];
b= [2
    -3
    2
    55
    16 
    -6];
n=length(A)
ExactX=A\b;
B=A;
c=b;

for i=1:n-1         %
    A(i+1:n,i)=A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);
end



U=triu(A);
L=eye(n)+tril(A,-1);
y=my_xsj(L,b)
x=my_ssj(U,y)
error=norm(ExactX-x)
residual=norm(b-B*x)