function lsj_euler(f,h,a,b,initial)
    x=a:h:b;
    y=a:h:b;
    y(1)=initial;
    k=(b-a)/h;
    for i=1:1:k
        y(i+1)=y(i)+h*f(x(i),y(i));
    end
    plot(x,y,'--');
    