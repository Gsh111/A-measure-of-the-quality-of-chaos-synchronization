SNR=[5,6,8,10,12,14,15,16,18,20,22,24,25,28,30,35];
figure(1)
%���ϵ��
set(gcf,'unit','centimeters','position',[0.2,0.2,7.2,4.8])
plot(SNR,CC);
hold on;
%Ȩ�ؾ�������Ľ��
plot(SNR,C11);
figure(2)
set(gcf,'unit','centimeters','position',[0.2,0.2,7.2,4.8])
plot(SNR,BER);
hold on;
plot(SNR,C22)