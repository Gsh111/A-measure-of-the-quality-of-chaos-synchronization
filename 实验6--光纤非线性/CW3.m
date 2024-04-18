function Wout2 = CW3(input)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

%load 'Wout.mat'
%trainLen=200000;
trainLen=40000;
%trainLen=40000;
testLen=1000;
initLen=100;
    


%data=reshape(input(end-500000:end),[],1);
data=reshape(input,[],1);
%data=reshape(MG,[],1);

% 需要训练的数据绘图
figure(10)
title('训练数据');
plot(data(1:trainLen));

%产生ESN储备池
inSize = 1;    %输入维数k
outSize = 1;   
%储备池中间非线性节点个数
resSize = 1000;   %储备池维数为N
a = 0.3; % leaking rate  可以看做是储备池的更新速度
rand( 'seed', 42 );
Win = (rand(resSize,1+inSize)-0.5) .* 1;    %N*(k+1)
W = rand(resSize,resSize)-0.5;    %N*N

disp 'Computing spectral radius...';
opt.disp = 0;
rhoW = abs(eigs(W,1,'LM',opt));  %谱半径是（最大特征值的绝对值）
disp 'done.' 
W = W .* ( 1.25/rhoW);    %归一化并重置谱半径

%为状态收集矩阵分配内存空间
X = zeros(1+inSize+resSize,trainLen-initLen);
%设置最终的目标矩阵（最终预测的是 延时为1200的数据）
%Yt = data(initLen+1+1200:trainLen+1200)';
Yt = data(initLen+1+1:trainLen+1)';

%训练
x = zeros(resSize,1);
for t = 1:trainLen
    u = data(t);
    x=(1-a)*x+ a*tanh( Win*[1;u] + W*x ); %中间状态的更新
    if t > initLen
		X(:,t-initLen) = [1;u;x];   %经过initLen之后，开始记录储备池状态
	end
end

reg = 1e-8;
Wout2 = ((X*X' + reg*eye(1+inSize+resSize)) \ (X*Yt'))'; 
%采用岭回归的方式
%ytrain=Wout*X;
%S=[];    %均方误差的计算
%S = [S mse(ytrain-Yt)];
%disp( ['S = ', num2str( S )] );

%测试
Y2 = zeros(outSize,testLen);    %最后的预测结果
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



