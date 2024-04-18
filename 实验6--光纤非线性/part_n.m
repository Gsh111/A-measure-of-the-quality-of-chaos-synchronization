%先取出最后10w个点
a=x(end-100000:end);
%b是加入噪声的数据   c=2
b=xn(end-100000:end);
%d是加入噪声的数据  c=1
d=xn(end-100000:end);
%d是加入噪声的数据  c=1.5
e=xn(end-100000:end);
%当大于2时，加入噪声数据，否则为a
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
figure(1)
plot(a,c','.')
corr2(a,c')
corr2(CW(a,c'),Wout)
%然后找一个全部加白噪声的数据  c=1.38时   0.9268 0.0338  误码率0.2063


%第二次实验c=1.67    
figure(2)
plot(x(end-100000:end),xn(end-100000:end),'.')
corr2(x(end-100000:end),xn(end-100000:end))
corr2(CW(x(end-100000:end),xn(end-100000:end)),Wout)
