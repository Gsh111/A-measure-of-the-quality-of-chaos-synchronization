%不采取数据平铺的方法
x11=awgn(x(end-20000:end),13,'measured');
xn1=awgn(x(end-60000:end-20001),18,'measured');
xn2=awgn(x(end-80000:end-60001),5,'measured');
xn3=awgn(x(end-100000:end-80001),10,'measured');
xn11=[xn3;xn2;xn1;x11];

figure(6)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-1500:end),xn11(end-1500:end),'.')
%plot(x(end-100000:end),xn11,'.')
corr(x(end-100000:end),xn11)
Wout1=CW(x(end-100000:end),x(end-100000:end));
corr2(Wout1,CW(x(end-100000:end),xn11))
random(x(end-100000:end),xn11)


xn22=awgn(x(end-100000:end),9.8,'measured');
figure(7)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-1500:end),xn22(end-1500:end),'.')
%plot(x(end-100000:end),xn22,'.');
corr(x(end-100000:end),xn22)
Wout2=CW(x(end-100000:end),x(end-100000:end));
corr2(Wout2,CW(x(end-100000:end),xn22))
random(x(end-100000:end),xn22)

xn33=awgn(x(end-100000:end),10,'measured');
corr(x(end-100000:end),xn33)
Wout2=CW(x(end-100000:end),x(end-100000:end));
corr2(Wout2,CW(x(end-100000:end),xn33))
random(x(end-100000:end),xn33)

figure(4)