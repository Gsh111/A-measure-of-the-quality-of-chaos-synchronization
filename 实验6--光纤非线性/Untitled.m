corr(s,q)
corr2(CW(s,s),CW(s,q))



%���ڼ����˹����������   c=1.7ʱ����
corr(x(end-100000:end),xn(end-100000:end))
corr2(CW(x(end-100000:end),x(end-100000:end)),CW(x(end-100000:end),xn(end-100000:end)))


figure(5)
plot(x(end-100000:end),xn(end-100000:end),'.')