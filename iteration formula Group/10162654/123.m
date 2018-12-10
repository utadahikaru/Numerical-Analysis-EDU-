function ex_diedai2
n=500;                                
A=rand(n,n)+n*eye(n);               
b=rand(n,1);                              % �����������b
tol=1e-12;                                %  ���ֵ
maxit=200;                                %  ���ѭ������
T1=cym_Jacobi(A,b,tol,maxit);           %  Jacobi������
T2=cym_Gauss_Seidel(A,b,tol,maxit);    % Gauss-Seidel ������
t1=size(T1,2);
t2=size(T2,2);                       
for i=1:t1                               
    x1(i)=norm(b-A*T1(:,i));           % ����ÿһ���ĵ������
end
for i=1:t2                                % ����ÿһ���ĵ������
    x2(i)=norm(b-A*T2(:,i));
end
semilogy(x1,'r-');                     % �����������ߵ�ͼ��
hold on
semilogy(x2,'b-.');
xlabel('��������','LineWidth',12)           % x��
ylabel('���','LineWidth',12)               % y��
legend('Jacobi������','Gauss-Seidel ������','Location','northeast')                                        %                                                                      % ��ͼ��ע
title('����������ͼ��');                       % ����
