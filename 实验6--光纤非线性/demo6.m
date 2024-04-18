%c=2 25dB
%c=0.05  37dB
%c=0.11 30dB

%c=0.35µÄÊ±ºòÊÇ20dB
x11=x(end-1500:end);
x22=xn(end-1500:end);
figure(5)
plot(x11,x22,'.');

Wout3=CW(x(end-100000:end),xn(end-100000:end));

Wout33=Wout3(1:500);

W3=reshape(Wout33,20,25);
figure(12)
set(gcf,'unit','centimeters','position',[0.2,0.2,7.2,4.8])
heatmap(W3);

corr2(Wout1,Wout3)
corr2(W1,W3)

corr(x(end-100000:end),xn(end-100000:end))