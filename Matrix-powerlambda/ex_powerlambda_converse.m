function ex_powerlambda_converse %
A =  [2  3  8;...
      2  3  1;...
      9  2  5]; 
%
B=A;
eig(B)
n=length(A);%
A=A+5*eye(n);%
A=A^-1;%
tol=1e-12;%
maxit=50;%
[lambda key]=lsj_power(A,tol,maxit);%
lambda=lambda^-1-5 %ÌØÕ÷Öµ¹éÎ»
semilogy(1:length(key),abs(key-key(end)))%
title('Power-Display(Converse)')%
legend('Error')%
