
% for const=[2.3	1.287 1.018 0.8 0.72 0.64 0.51 0.41 0.32 0.258 0.23 0.206 0.162 0.129]
% rand('seed', 44); 
% sim('Ikeda_n.slx');
C1=[]; 
C2=[];
BER=[];
 x1=x(end-100000:end);
 xn1=xn(end-100000:end);
% 首先对x进行量化
avg=sum(x1)/length(x1);
for i=1:1:length(x1)
    if x1(i)>avg
        C1=[C1 1];
    else
        C1=[C1 0];
    end
end

% 再对xn进行量化
avg1=sum(xn1)/length(xn1);
for i=1:1:length(xn1)
    if xn1(i)>avg1
        C2=[C2 1];
    else
        C2=[C2 0];
    end
end




%计算误码率  一共五组数据
diff=0;
for p=1:length(C1) 
    if(C1(p)==C2(p))
        diff=diff+1;
    end
end
ber=(length(C1)-diff)/length(C1)

% end

