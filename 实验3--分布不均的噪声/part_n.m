%��ȡ�����10w����
a=x(end-100000:end);
%b�Ǽ�������������   ����5dB���� c=1.91
b=xn(end-100000:end);
%d�Ǽ�������������  ����10dB����  c=1.07
d=xn(end-100000:end);
%e�Ǽ�������������  ����8dB����  c=1.35
e=xn(end-100000:end);
%������0ʱ��������������b������Ϊd
%��-1<x<0ʱ��������������e������Ϊd
c=[];
for i=1:length(a)
    if(a(i)>0)
     c(i)=b(i);
    elseif(a(i)>-1 & a(i)<=0)
      c(i)=e(i); 
    else c(i)=d(i);
    end
end
%����2ʱ��������
%��һ���������ϵ��  0.9234    0.0341   ������ 0.1902
cc=c';
figure(1)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(a(end-3000:end),cc(end-3000:end),'.')

corr2(a,c')
Wout=CW(a,a);
corr2(CW(a,c'),Wout)
%������������Ľ��
random(a,c')

%Ȼ����һ��ȫ���Ӱ�����������  c=1.38ʱ   0.9268 0.0338  ������0.2063


%�ڶ���ʵ��6.5dB    c=1.6
figure(2)
set(gcf,'unit','centimeters','position',[0.2,0.12,7,4.8])
plot(x(end-3000:end),xn(end-3000:end),'.')
corr2(x(end-100000:end),xn(end-100000:end))
Wout1=CW(x(end-100000:end),x(end-100000:end));
corr2(CW(x(end-100000:end),xn(end-100000:end)),Wout1)
random(x(end-100000:end),xn(end-100000:end))

%���������ʲ������������Ѱ�����������ʷ��ϵ����
%c=1.63�����  ����

figure(3)

