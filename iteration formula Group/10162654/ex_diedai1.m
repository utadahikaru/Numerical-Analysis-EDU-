 function ex_diedai1
A=[5 2 1;-1 4 2;2 -3 10];
b=[-12;20;3];
tol=1e-12;
maxit=100;
x1=cym_Jacobi(A,b,tol,maxit);
x2=cym_Gauss_Seidel(A,b,tol,maxit);
