%e=xn(end-100000:end)-x(end-100000:end);
%e=q-s;

%������1w��bit
me=m+e(end-100000:end);
% %�˲�֮�������  me1  �������˲�
% Hd = f;
% me1=filter(Hd,me);


BB=[];    %���ǰ��

%����M��ֵ
for i=5:10:length(m) 
    BB=[BB,m(i)];
end




C=[];     %������

avg=sum(me)/length(me);
for i=5:10:length(me)
    if me(i)>avg
        C=[C 0.25];
    else
        C=[C -0.25];
    end
end




%����������  һ����������
diff=0;
for p=1:length(C) 
    if(C(p)==BB(p))
        diff=diff+1;
    end
end
ber=(length(C)-diff)/length(C)