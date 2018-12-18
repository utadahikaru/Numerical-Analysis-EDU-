function ex_powerlambda %
A=[-3 4 -3;
4 -6 -3;
-3 -3 -1];
eig(A)
%
tol=1e-12;%
maxit=50;%
[lambda key]=lsj_power(A,tol,maxit)%
semilogy(1:length(key),abs(key-key(end)))%
title('Power-Display')
legend('Error')
