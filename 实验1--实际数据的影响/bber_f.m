%e=xn(end-100000:end)-x(end-100000:end);
%e=q-s;
e=Bob_align(end-100000:end)-Alice_align(end-100000:end);

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
        C=[C 0.1];
    else
        C=[C 0];
    end
end

%前五个数据不同去除掉
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