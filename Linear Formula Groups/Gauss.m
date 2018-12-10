function ex_ADV_FormulaGroup(A,b)
A=rand(800,800);
b=rand(800,1);
n=length(A);
ExactX=A\b;
B=A;
c=b;
tic
for i=1:n-1
[~,idx]=max(abs(A(i:n,i)));    %取列最大元 
idx=idx+i-1;       %框定我们可能需要换掉的行 
new=A(i,:);A(i,:)=A(idx,:);A(idx,:)=new;
new=b(i,1);b(i,1)=b(idx,1);b(idx,1)=new;
A(i+1:n,i)=A(i+1:n,i)/A(i,i);
A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-A(i+1:n,i)*A(i,i+1:n);
b(i+1:n,1)=b(i+1:n,1)-A(i+1:n,i)*b(i);
end
for i=n:-1:1 
    b(i)=(b(i)-A(i,i+1:n)*b(i+1:n))/A(i,i);%利用上三角性质矩阵求解
end
error=norm(ExactX-b);
residual=norm(c-B*b);
toc
end