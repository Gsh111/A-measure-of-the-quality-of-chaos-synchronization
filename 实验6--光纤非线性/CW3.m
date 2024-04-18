function Wout2 = CW3(input)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%load 'Wout.mat'
%trainLen=200000;
trainLen=40000;
%trainLen=40000;
testLen=1000;
initLen=100;
    


%data=reshape(input(end-500000:end),[],1);
data=reshape(input,[],1);
%data=reshape(MG,[],1);

% ��Ҫѵ�������ݻ�ͼ
figure(10)
title('ѵ������');
plot(data(1:trainLen));

%����ESN������
inSize = 1;    %����ά��k
outSize = 1;   
%�������м�����Խڵ����
resSize = 1000;   %������ά��ΪN
a = 0.3; % leaking rate  ���Կ����Ǵ����صĸ����ٶ�
rand( 'seed', 42 );
Win = (rand(resSize,1+inSize)-0.5) .* 1;    %N*(k+1)
W = rand(resSize,resSize)-0.5;    %N*N

disp 'Computing spectral radius...';
opt.disp = 0;
rhoW = abs(eigs(W,1,'LM',opt));  %�װ뾶�ǣ��������ֵ�ľ���ֵ��
disp 'done.' 
W = W .* ( 1.25/rhoW);    %��һ���������װ뾶

%Ϊ״̬�ռ���������ڴ�ռ�
X = zeros(1+inSize+resSize,trainLen-initLen);
%�������յ�Ŀ���������Ԥ����� ��ʱΪ1200�����ݣ�
%Yt = data(initLen+1+1200:trainLen+1200)';
Yt = data(initLen+1+1:trainLen+1)';

%ѵ��
x = zeros(resSize,1);
for t = 1:trainLen
    u = data(t);
    x=(1-a)*x+ a*tanh( Win*[1;u] + W*x ); %�м�״̬�ĸ���
    if t > initLen
		X(:,t-initLen) = [1;u;x];   %����initLen֮�󣬿�ʼ��¼������״̬
	end
end

reg = 1e-8;
Wout2 = ((X*X' + reg*eye(1+inSize+resSize)) \ (X*Yt'))'; 
%������ع�ķ�ʽ
%ytrain=Wout*X;
%S=[];    %�������ļ���
%S = [S mse(ytrain-Yt)];
%disp( ['S = ', num2str( S )] );

%����
Y2 = zeros(outSize,testLen);    %����Ԥ����
for t = 1:testLen 
    u = data(trainLen+t);
	x = (1-a)*x + a*tanh( Win*[1;u] + W*x );
	y = Wout2*[1;u;x];
	Y2(:,t) = y;
    %u = y;
end


errorLen = testLen;
mse = sum((data(trainLen+1+1200:trainLen+errorLen+1200)'-Y2(1,1:errorLen)).^2)./errorLen;
disp( ['MSE = ', num2str( mse )] );

figure(1);
plot( data(trainLen+2:trainLen+testLen+1), 'color', [0,0.75,0] );
hold on;
plot( Y2', 'b' );
hold off;
axis tight;
title('Target and generated signals y(n) starting at n=0');
legend('Target signal', 'Free-running predicted signal');


end



