C11=[];
C22=[];
BER=[];
CC=[];

%对于常数
%1.91 对应5dB  1.07 10dB   0.604 15dB  0.34  20dB  0.19 25dB 0.107 30dB
%1.7 6dB   1.52 7dB   1.35  8dB    0.85 12dB  0.68 14dB    0.54 16dB  0.43 18dB 0.216  24dB  0.06  35dB        
%0.27  22dB  0.135 28dB
for const=[1.91 1.7 1.35 1.07 0.85 0.68 0.604 0.54 0.43 0.34 0.27 0.216 0.19 0.135 0.107 0.06]
rand('seed', 44); 
sim('Ikeda_n.slx');


%计算误码率
e=xn(end-100000:end)-x(end-100000:end);

%明文是1w个bit
me=m+e(end-100000:end);
%滤波之后的数据  me1
Hd = f1;
me1=filter(Hd,me);


BB=[];    %解调前的
C1=[];
C2=[];
%明文M的值
for i=5:10:length(m) 
    BB=[BB,m(i)];
end


%前五个数据不同去除掉
for j=1:length(BB)-5
    C2=[C2 BB(j)];
end


C=[];     %解调后的

avg=sum(me1)/length(me1);
for i=5:10:length(me1)
    if me1(i)>avg
        C=[C 0.25];
    else
        C=[C -0.25];
    end
end

%前六个数据不同去除掉
for k=6:length(C)
    C1=[C1 C(k)];
end


%计算误码率  一共五组数据
diff=0;
for p=1:length(C1) 
    if(C1(p)==C2(p))
        diff=diff+1;
    end
end
ber=(length(C1)-diff)/length(C1)
BER=[BER ber];

a=corr(x(end-100000:end),xn(end-100000:end));
CC=[CC a];

%输入x，输出xn，权重矩阵比较
Wout=CW(x(end-100000:end),x(end-100000:end));
b=corr2(CW(x(end-100000:end),xn(end-100000:end)),Wout);
C11=[C11 b];

%随机比特量化后的，最后的误比特率
c=random(x(end-100000:end),xn(end-100000:end));
C22=[C22 c];

end