function x=lsj_Gauss_Seidel(A,b,tol,maxit) %
n=length(A);%                                   
x=zeros(n,1);%
D=diag(diag(A));%                            
L=-tril(A,-1);%           
U=-triu(A,1); %           
x(:,2)=(D-L)\U*x+(D-L)\b; %
k=2; %                  
while norm(x(:,k)-x(:,k-1))>tol&&k<maxit %  
    k=k+1; %
    x(:,k)=(D-L)\U *x(:,k-1)+(D-L)\b; %                
end  %        
x
