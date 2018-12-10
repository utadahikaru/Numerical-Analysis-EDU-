function ex_compare_time
tol=1e-12;
maxit=1000;
k=1;
format long
for px=50:50:1000                       % ��������������μ���
    i=px;
    A=rand(i,i)+i*eye(i);             % �������n�׾��󣬶Խ�������n*eye(n)
    b=rand(i,1);                        % �������i*1��������
    t=cputime;
    r1=cym_Jacobi(A,b,tol,maxit);
    t1(k)=cputime-t;                   % Jacobi����õ�ʱ��
    r2=cym_Gauss_Seidel(A,b,tol,maxit); 
    t2(k)=cputime-t;                   % Gauss_Seidel����õ�ʱ��
    r3=cym_lzygauss3(A,b);
    t3(k)=cputime-t;                   % ����Ԫ����˹����õ�ʱ��
    k=k+1;
end
px=50:50:1000;
plot(px,t1,'r-');                                  % t1��ͼ�� 
hold on
plot(px,t2,'b-.');                                 % t2��ͼ��
hold on
plot(px,t3,'k--');                                 % t3��ͼ��
legend('Jacobi��','Gauss-Seidel��','Gauss��ȥ��','Location','best');                              % ע��
xlabel('�������','LineWidth',2);                 % x��
ylabel('�������ʱ��','LineWidth',2);             % y��
title('��ͬ�������ʱ��ĶԱ�');                     % �ӱ���

