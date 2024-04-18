corr(s,q)
corr2(CW(s,s),CW(s,q))



%现在计算高斯白噪声数据   c=1.7时符合
corr(x(end-100000:end),xn(end-100000:end))
corr2(CW(x(end-100000:end),x(end-100000:end)),CW(x(end-100000:end),xn(end-100000:end)))


figure(5)
plot(x(end-100000:end),xn(end-100000:end),'.')