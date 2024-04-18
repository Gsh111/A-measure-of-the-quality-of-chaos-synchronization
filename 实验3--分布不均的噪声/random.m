
function ber = random(ipnut1,input2)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
C1=[]; 
C2=[];

 x1=ipnut1(end-100000:end);
 xn1=input2(end-100000:end);
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
end

