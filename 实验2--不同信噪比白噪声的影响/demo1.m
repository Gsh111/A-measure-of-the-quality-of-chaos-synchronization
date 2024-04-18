A=linspace(1,1,100001);
Wout1=CW(A',A');
Wout=CW(x(end-100000:end),x(end-100000:end));
corr2(Wout1,Wout)