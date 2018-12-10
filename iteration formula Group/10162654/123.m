function ex_diedai2
n=500;                                
A=rand(n,n)+n*eye(n);               
b=rand(n,1);                              % 生成随机向量b
tol=1e-12;                                %  误差值
maxit=200;                                %  最大循环次数
T1=cym_Jacobi(A,b,tol,maxit);           %  Jacobi迭代法
T2=cym_Gauss_Seidel(A,b,tol,maxit);    % Gauss-Seidel 迭代法
t1=size(T1,2);
t2=size(T2,2);                       
for i=1:t1                               
    x1(i)=norm(b-A*T1(:,i));           % 计算每一步的迭代误差
end
for i=1:t2                                % 计算每一步的迭代误差
    x2(i)=norm(b-A*T2(:,i));
end
semilogy(x1,'r-');                     % 绘制收敛曲线的图像
hold on
semilogy(x2,'b-.');
xlabel('迭代次数','LineWidth',12)           % x轴
ylabel('误差','LineWidth',12)               % y轴
legend('Jacobi迭代法','Gauss-Seidel 迭代法','Location','northeast')                                        %                                                                      % 绘图标注
title('迭代收敛的图像');                       % 标题
