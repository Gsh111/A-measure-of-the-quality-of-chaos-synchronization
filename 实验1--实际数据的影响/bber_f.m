%e=xn(end-100000:end)-x(end-100000:end);
%e=q-s;
e=Bob_align(end-100000:end)-Alice_align(end-100000:end);

%������1w��bit
me=m+e(end-100000:end);
%�˲�֮�������  me1
Hd = f1;
me1=filter(Hd,me);


BB=[];    %���ǰ��
C1=[];
C2=[];
%����M��ֵ
for i=5:10:length(m) 
    BB=[BB,m(i)];
end


%ǰ������ݲ�ͬȥ����
for j=1:length(BB)-5
    C2=[C2 BB(j)];
end


C=[];     %������

avg=sum(me1)/length(me1);
for i=5:10:length(me1)
    if me1(i)>avg
        C=[C 0.1];
    else
        C=[C 0];
    end
end

%ǰ������ݲ�ͬȥ����
for k=6:length(C)
    C1=[C1 C(k)];
end


%����������  һ����������
diff=0;
for p=1:length(C1) 
    if(C1(p)==C2(p))
        diff=diff+1;
    end
end
ber=(length(C1)-diff)/length(C1)