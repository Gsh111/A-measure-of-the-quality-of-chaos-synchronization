
x1 = x(end-5000:end);
x2 = x(end-5000-5000:end-5000);

[y1,zf] = filter(b,a,x1);
y2 = filter(b,a,x2,zf);
y = filter(b,a,x);
isequal(y,[y1;y2])

figure(7)
plot(x(end-5000:end),x1(end-5000:end),'.')
figure(8)
plot(x(end-100:end))
hold on;
plot(x1(end-100:end))
corr2(x(end-5000:end),x1(end-5000:end))

Wout1=CW(x(end-100000:end),x(end-100000:end));
Wout2=CW(x(end-100000:end),x1(end-100000:end));
corr2(Wout1,Wout2)