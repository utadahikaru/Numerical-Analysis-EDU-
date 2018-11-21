function key=test_romberg %
a=0;
tol=1e-12;maxit=50;
f=@(x) 1/sqrt(2*pi)*exp(-1/2*x^2);
for i=0:0.01:0.39
format long
    T=lsj_Romberg(f,a,i,tol,maxit);
i
end
end
