function Wout1 = CW(input1,input2)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

trainLen=40000;
testLen=1000;
initLen=100;
    
 data1=input1';
 data2=input2;


figure(10);
plot(data2);

%����ESN������
inSize = 1;    %����ά��k
outSize = 1;   
%�������м�����Խڵ����
resSize = 500;
lr = 0.3; % leaking rate  ���Կ����Ǵ����صĸ����ٶ�
rand( 'seed', 42 );     %����������,����ÿ�γ�ʼ�������һ�� 
Win = (rand(resSize,1+inSize)-0.5) .* 1;    %N*(k+1)
W = rand(resSize,resSize)-0.5;    %N*N

disp 'Computing spectral radius...';
opt.disp = 0;
rhoW = abs(eigs(W,1,'LM',opt));  %�װ뾶�ǣ��������ֵ�ľ���ֵ��
disp 'done.' 
W = W .* ( 1.8/rhoW);    %��һ���������װ뾶

%Ϊ״̬�ռ���������ڴ�ռ�
X = zeros(1+inSize+resSize,trainLen-initLen);
%�������յ�Ŀ�����
Yt=data2(initLen+1:trainLen);

%ѵ��
x1 = zeros(resSize,1);
for t = 1:trainLen
    u = data1(t);
    x1=(1-lr)*x1+ lr*tanh( Win*[1;u] + W*x1 ); %�м�״̬�ĸ���
    if t > initLen
		X(:,t-initLen) = [1;u;x1];   %����initLen֮�󣬿�ʼ��¼������״̬
	end
end

reg = 1e-8;
Wout1 = ((X*X' + reg*eye(1+inSize+resSize)) \ (X*Yt))'; 


%����
Y1 = zeros(outSize,testLen);
u=data1;
for t = 1:testLen 
    
	x1 = (1-lr)*x1 + lr*tanh( Win*[1;u(t)] + W*x1 );
	y = Wout1*[1;u(t);x1];
	Y1(:,t) = y;
end

figure(11);
plot( data2(1:testLen), 'color', [0,0.75,0] );
hold on;
plot( Y1', 'b' );
hold off;
axis tight;
title('Target and generated signals y(n) starting at n=0');
legend('Target signal', 'Free-running predicted signal');

%W=corr2(Wout,Wout1)


end



