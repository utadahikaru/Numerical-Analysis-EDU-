function ex_compare_time
tol=1e-12;
maxit=1000;
k=1;
format long
for px=50:50:1000                       % 按照所设阶数依次计算
    i=px;
    A=rand(i,i)+i*eye(i);             % 随机生成n阶矩阵，对角线增加n*eye(n)
    b=rand(i,1);                        % 随机生成i*1的列向量
    t=cputime;
    r1=cym_Jacobi(A,b,tol,maxit);
    t1(k)=cputime-t;                   % Jacobi法求得的时间
    r2=cym_Gauss_Seidel(A,b,tol,maxit); 
    t2(k)=cputime-t;                   % Gauss_Seidel法求得的时间
    r3=cym_lzygauss3(A,b);
    t3(k)=cputime-t;                   % 列主元法高斯法求得的时间
    k=k+1;
end
px=50:50:1000;
plot(px,t1,'r-');                                  % t1的图像 
hold on
plot(px,t2,'b-.');                                 % t2的图像
hold on
plot(px,t3,'k--');                                 % t3的图像
legend('Jacobi法','Gauss-Seidel法','Gauss消去法','Location','best');                              % 注释
xlabel('矩阵阶数','LineWidth',2);                 % x轴
ylabel('求解所用时间','LineWidth',2);             % y轴
title('不同方法求解时间的对比');                     % 加标题

