%先取出最后10w个点
a=x(end-100000:end);
%b是加入噪声的数据   加入5dB噪声 c=1.91
b=xn(end-100000:end);
%d是加入噪声的数据  加入10dB噪声  c=1.07
d=xn(end-100000:end);
%e是加入噪声的数据  加入8dB噪声  c=1.35
e=xn(end-100000:end);
%当大于0时，加入噪声数据b，否则为d
%当-1<x<0时，加入噪声数据e，否则为d
c=[];
for i=1:length(a)
    if(a(i)>0)
     c(i)=b(i);
    elseif(a(i)>-1 & a(i)<=0)
      c(i)=e(i); 
    else c(i)=d(i);
    end
end
%大于2时加入噪声
%第一步计算相关系数  0.9234    0.0341   误码率 0.1902
cc=c';
figure(1)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(a(end-3000:end),cc(end-3000:end),'.')

corr2(a,c')
Wout=CW(a,a);
corr2(CW(a,c'),Wout)
%随机比特量化的结果
random(a,c')

%然后找一个全部加白噪声的数据  c=1.38时   0.9268 0.0338  误码率0.2063


%第二次实验6.5dB    c=1.6
figure(2)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-3000:end),xn(end-3000:end),'.')
corr2(x(end-100000:end),xn(end-100000:end))
Wout1=CW(x(end-100000:end),x(end-100000:end));
corr2(CW(x(end-100000:end),xn(end-100000:end)),Wout1)
random(x(end-100000:end),xn(end-100000:end))

%随机误比特率不符合情况，现寻找随机误比特率符合的情况
%c=1.63的情况  符合

figure(3)

