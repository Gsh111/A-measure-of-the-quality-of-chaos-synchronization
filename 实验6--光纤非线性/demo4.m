
x1=x(end-1500:end);
x2=xn(end-1500:end);
figure(6)
set(gcf,'unit','centimeters','position',[0.2,0.2,7,4.8])
plot(x1,x2,'.')
corr(x1,x2)
x11=x1(end-100-80:end-80)
x22=x2(end-100:end)

figure(9)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-1500:end),q(end-1500:end),'.')
corr(x(end-1500:end),q(end-1500:end))

figure(8)
x3=x(end-1500:end);
x4=xn(end-1500:end);
set(gcf,'unit','centimeters','position',[0.2,0.2,7,4.8])
plot(x3,x4,'.')
corr(x3,x4)

figure(11)
set(gcf,'unit','centimeters','position',[0.2,0.2,7,4.8])
plot(x(end-1500:end),xn(end-1500:end),'.')
