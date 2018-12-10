function ex_basic      %
n=1000;                                
A=rand(n,n)+n*eye(n);               
b=rand(n,1);                   
tol=1e-12;                          
maxit=200;                      
T1=lsj_Jacobi(A,b,tol,maxit)  %      
T2=lsj_Gauss_Seidel(A,b,tol,maxit) %
t1=size(T1,2);%
t2=size(T2,2);%                   
for i=1:t1      %                          
    x1(i)=norm(b-A*T1(:,i)); %         
end       %
for i=1:t2  %                           
    x2(i)=norm(b-A*T2(:,i));
end        %
semilogy(x1,'r-');   %                  
hold on         %
semilogy(x2,'b-.');  %
xlabel('Steps','LineWidth',12)    %       
ylabel('error','LineWidth',12)    %        
legend('Jacobi','Gauss-Seidel')  %                                                                      % »æÍ¼±ê×¢
title('G-S VS Jacobi 500');       %              
