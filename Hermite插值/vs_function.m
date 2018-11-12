function vs_function%定义比较函数
    x = -5:1:5;%
    y = cos(abs(x)+x);%
    La = my_Lagrange(x,y);%
    x2 = -5:0.1:5;%
    y2 = cos(abs(x2)+x2);%
    y3 = polyval(La,x2);%
    
    plot(x2,y2,'linewidth',0.25);%
    hold on%
    plot(x2,y3,'-.','linewidth',2);%
    
    H = my_spline(x,y);%
    m = length(x);%
    for i=1:m-1%
        x3 = x(i):0.1:x(i+1);%
        y3 = polyval(H(i,:),x3);%
        plot(x3,y3,'--r','linewidth',2);%
    end %
    legend('The Origin','The Lagrange','Tri-Spline');%
    title('The Grand Finale');%
 end
