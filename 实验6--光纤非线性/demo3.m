x1=x(end-100000:end);
Wout1=CW(x1,x1);
x2=ones(100001,1);
Wout2=CW(x2,x2);

figure(3)
histogram(Wout1,'normalization','probability')
figure(4)
histogram(Wout2,'normalization','probability')

corr2(Wout1,Wout2)