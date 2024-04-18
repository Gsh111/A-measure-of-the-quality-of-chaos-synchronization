figure(3)
plot(x(end-100000:end),xn(end-100000:end),'.')
%想法当x大于0时，xn对应的值减去根号x   此时的x和xn对应着c=0.68
s=x(end-100000:end);
q=xn(end-100000:end);

%最后用的是c=0.9时，对应的相关系数是0.9455
for i=1:length(s)
if(s(i)>0)
    q(i)=q(i)-(s(i)*s(i))/4.8;
else
    q(i)=q(i)-(s(i)*s(i))/4.8;
end
end
% for i=1:length(s)
% if(q(i)<-1)
% s(i)=s(i)+(-q(i)*sqrt(-q(i)))/9;
%    %p(i)=p(i);
% else
%     s(i)=s(i);
% end
% end
figure(4)
plot(s(end-3000:end),q(end-3000:end),'.')
%plot(s,q,'.')
corr(x(end-100000:end),q)
%corr(s(end-40000:end),q(end-40000:end))
% random(s,q)
Wout1=CW(s,s);
Wout2=CW(s,q);
corr2(Wout1,Wout2)

figure(5)
plot(x(end-3000:end),xn(end-3000:end),'.')
corr(x(end-100000:end),xn(end-100000:end))
%corr(s(end-40000:end),q(end-40000:end))
%random(s(end-40000:end),q(end-40000:end))
%random(x(end-100000:end),xn(end-100000:end))
Wout3=CW(x(end-100000:end),x(end-100000:end));
Wout4=CW(x(end-100000:end),xn(end-100000:end));
corr2(Wout3,Wout4)

figure(6)