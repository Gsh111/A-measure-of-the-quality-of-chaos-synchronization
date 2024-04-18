%effbandt1 测量的是光域谱 去除中央极大值后所得到的有效带宽
%首先将程序导入MATLAB中，将频率与功率分别存为变量f、p
%先在Excel中功率p从dbm转换成mw
%计算思路如下：
%对于对称的光频谱，只考虑一边，计算出的带宽
%先计算整个带宽中所有频率分量的总功率和
%然后按频率从中心向一边的顺序，将功率逐个相加，当得到的功率最接近总功率的80%时，记下此时频率与中心频率的插值
%其两倍即为所求的带宽
function b=effbandt1(f,p)
s=length(p);
[m,o]=max(p);			%得到功率最大的中心频率点
%n=f(o)-f(o-1);
%sum=m*n/2;
sum=0;
temp=0;
%temp=m*n/2;

for m=(o+2):s
	n=f(m)-f(m-1);
	sum=sum+0.5*(p(m)+p(m-1))*n;
end
t1=0.8*sum;
t2=0.8*sum;                             %t2表示前差量，t1表示后差量
for m=(o+2):s
	n=f(m)-f(m-1);
    temp=temp+0.5*(p(m)+p(m-1))*n;
    t1=0.8*sum-temp;
        if t1*t2<=0
            if abs(t2)>abs(t1)
                b=f(m)-f(o);t2=t1;
            else
                b=f(m-1)-f(o);t2=t1;
            end
        else
            t2=t1;
        end
end
end