%e=xn(end-100000:end)-x(end-100000:end);
%e=q-s;

%明文是1w个bit
me=m+e(end-100000:end);
% %滤波之后的数据  me1  不进行滤波
% Hd = f;
% me1=filter(Hd,me);


BB=[];    %解调前的

%明文M的值
for i=5:10:length(m) 
    BB=[BB,m(i)];
end




C=[];     %解调后的

avg=sum(me)/length(me);
for i=5:10:length(me)
    if me(i)>avg
        C=[C 0.25];
    else
        C=[C -0.25];
    end
end




%计算误码率  一共五组数据
diff=0;
for p=1:length(C) 
    if(C(p)==BB(p))
        diff=diff+1;
    end
end
ber=(length(C)-diff)/length(C)