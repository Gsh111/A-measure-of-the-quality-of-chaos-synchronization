C11=[];
C22=[];
BER=[];
CC=[];

%���ڳ���
%1.91 ��Ӧ5dB  1.07 10dB   0.604 15dB  0.34  20dB  0.19 25dB 0.107 30dB
%1.7 6dB   1.52 7dB   1.35  8dB    0.85 12dB  0.68 14dB    0.54 16dB  0.43 18dB 0.216  24dB  0.06  35dB        
%0.27  22dB  0.135 28dB
for const=[1.91 1.7 1.35 1.07 0.85 0.68 0.604 0.54 0.43 0.34 0.27 0.216 0.19 0.135 0.107 0.06]
rand('seed', 44); 
sim('Ikeda_n.slx');


%����������
e=xn(end-100000:end)-x(end-100000:end);

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
        C=[C 0.25];
    else
        C=[C -0.25];
    end
end

%ǰ�������ݲ�ͬȥ����
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
BER=[BER ber];

a=corr(x(end-100000:end),xn(end-100000:end));
CC=[CC a];

%����x�����xn��Ȩ�ؾ���Ƚ�
Wout=CW(x(end-100000:end),x(end-100000:end));
b=corr2(CW(x(end-100000:end),xn(end-100000:end)),Wout);
C11=[C11 b];

%�������������ģ������������
c=random(x(end-100000:end),xn(end-100000:end));
C22=[C22 c];

end