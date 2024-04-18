Wout1=CW(x(end-100000:end),x(end-100000:end));
Wout2=CW(s,q);

Wout11=Wout1(1:500);
Wout22=Wout2(1:500);

W1=reshape(Wout11,20,25);
W2=reshape(Wout22,20,25);
figure(12)
set(gcf,'unit','centimeters','position',[0.2,0.2,7.2,4.8])
heatmap(W1);

figure(9)
set(gcf,'unit','centimeters','position',[0.2,0.2,7.2,4.8])
heatmap(W2);

corr2(Wout1,Wout2)
corr2(Wout11,Wout22)
