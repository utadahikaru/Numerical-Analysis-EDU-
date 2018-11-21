function key=test_trapezoid

f=@(x) sin(x)./x;
a=1;
b=100;
tol=1e-12;maxit=50;
tic
Tslow=lsj_trapezoid(f,a,b,tol,maxit);
toc
tic
Tfast=lsj_fast_trapezoid(f,a,b,tol,maxit);
toc
semilogy(abs(Tslow-Tslow(end))),'r-.','LineWidth',2)
hold on
semilogy(abs(Tslow-Tslow(end))),':','LineWidth',2)
end
