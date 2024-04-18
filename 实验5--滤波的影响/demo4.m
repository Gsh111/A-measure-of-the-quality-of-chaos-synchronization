Hd = f111;
%x1是x滤波之后的结果
x1=filter(Hd,x(end-100000:end));

x11=x(end-100000-2:end-2);
x22=x1(end-100000:end);

corr2(x11,x22)
figure(1)
plot(x11)
hold on;
plot(x22)
figure(2)
plot(x11,x22,'.')


Wout1=CW(x11,x11);
Wout2=CW(x11,x22);
corr2(Wout1,Wout2)

corr2(x(end-100000:end),xn(end-100000:end))
Wout3=CW(x(end-100000:end),x(end-100000:end));
Wout4=CW(x(end-100000:end),xn(end-100000:end));
corr2(Wout3,Wout4)

figure(3)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x11(end-3000:end),x22(end-3000:end),'.')

figure(4)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-3000:end),xn(end-3000:end),'.')

figure(5)

