%��Ӧ��һ��ͼ 5.5dB  c=1.8
figure(5)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-1000:end),xn(end-1000:end),'.')

%��Ӧ�ڶ���ͼ10.6dB  c=1
figure(6)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-1000:end),xn(end-1000:end),'.')

%��Ӧ������ͼ5.2dB   c=1.86
figure(7)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-1000:end),xn(end-1000:end),'.')

%��Ӧ������ͼ7.7dB
figure(8)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-1000:end),xn(end-1000:end),'.')

corr2(x(end-100000:end),xn(end-100000:end))
Wout1=CW(x(end-100000:end),x(end-100000:end));
Wout11=CW(x(end-100000:end),xn(end-100000:end));
corr2(Wout1,Wout11)
random(x(end-100000:end),xn(end-100000:end))

figure(9)