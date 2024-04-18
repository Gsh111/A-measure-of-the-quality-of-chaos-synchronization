corr2(Alice_align(end-100000:end),Bob_align(end-100000:end))
corr2(Alice_align2(end-100000:end),Bob_align2(end-100000:end))
corr2(Alice_align3(end-100000:end),Bob_align3(end-100000:end))
% corr2(Alice_align4,Bob_align4)
corr2(Alice_align4(end-100000:end),Bob_align4(end-100000:end))
corr2(Alice_align5(end-100000:end),Bob_align5(end-100000:end))
figure(1)
plot(Alice_align(end-1500:end),Bob_align(end-1500:end),'.')
figure(2)
plot(Alice_align2(end-1500:end),Bob_align2(end-1500:end),'.')
figure(3)
plot(Alice_align3(end-1500:end),Bob_align3(end-1500:end),'.')
figure(4)
plot(Alice_align4(end-1500:end),Bob_align4(end-1500:end),'.')
figure(5)
plot(Alice_align5(end-1500:end),Bob_align5(end-1500:end),'.')
 figure(6)
subplot(2,2,1)
figure(1)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(Alice_align(end-1000:end),Bob_align(end-1000:end),'.')
%subplot(2,2,2)
figure(2)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(Alice_align2(end-1000:end),Bob_align2(end-1000:end),'.')
%subplot(2,2,3)
figure(3)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(Alice_align3(end-1000:end),Bob_align3(end-1000:end),'.')
figure(4)
%subplot(2,2,4)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(Alice_align5(end-1000:end),Bob_align5(end-1000:end),'.')
Wout1=CW(Alice_align(end-100000:end),Alice_align(end-100000:end));
Wout11=CW(Alice_align(end-100000:end),Bob_align(end-100000:end));
corr2(Wout1,Wout11)

Wout2=CW(Alice_align2(end-100000:end),Alice_align2(end-100000:end));
Wout22=CW(Alice_align2(end-100000:end),Bob_align2(end-100000:end));
corr2(Wout2,Wout22)

Wout3=CW(Alice_align3(end-100000:end),Alice_align3(end-100000:end));
Wout33=CW(Alice_align3(end-100000:end),Bob_align3(end-100000:end));
corr2(Wout3,Wout33)

Wout4=CW(Alice_align4(end-100000:end),Alice_align4(end-100000:end));
Wout44=CW(Alice_align4(end-100000:end),Bob_align4(end-100000:end));
corr2(Wout4,Wout44)

Wout5=CW(Alice_align5(end-100000:end),Alice_align5(end-100000:end));
Wout55=CW(Alice_align5(end-100000:end),Bob_align5(end-100000:end));
corr2(Wout5,Wout55)

random(Alice_align(end-100000:end),Bob_align(end-100000:end))
random(Alice_align2(end-100000:end),Bob_align2(end-100000:end))
random(Alice_align3(end-100000:end),Bob_align3(end-100000:end))
random(Alice_align5(end-100000:end),Bob_align5(end-100000:end))