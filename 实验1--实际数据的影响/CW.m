function Wout1 = CW(input1,input2)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明

trainLen=40000;
testLen=1000;
initLen=100;
    
 data1=input1';
 data2=input2;


figure(10);
plot(data2);

%产生ESN储备池
inSize = 1;    %输入维数k
outSize = 1;   
%储备池中间非线性节点个数
resSize = 500;
lr = 0.3; % leaking rate  可以看做是储备池的更新速度
rand( 'seed', 42 );     %设计随机种子,保持每次初始矩阵随机一致 
Win = (rand(resSize,1+inSize)-0.5) .* 1;    %N*(k+1)
W = rand(resSize,resSize)-0.5;    %N*N

disp 'Computing spectral radius...';
opt.disp = 0;
rhoW = abs(eigs(W,1,'LM',opt));  %谱半径是（最大特征值的绝对值）
disp 'done.' 
W = W .* ( 1.8/rhoW);    %归一化并重置谱半径

%为状态收集矩阵分配内存空间
X = zeros(1+inSize+resSize,trainLen-initLen);
%设置最终的目标矩阵
Yt=data2(initLen+1:trainLen);

%训练
x1 = zeros(resSize,1);
for t = 1:trainLen
    u = data1(t);
    x1=(1-lr)*x1+ lr*tanh( Win*[1;u] + W*x1 ); %中间状态的更新
    if t > initLen
		X(:,t-initLen) = [1;u;x1];   %经过initLen之后，开始记录储备池状态
	end
end

reg = 1e-8;
Wout1 = ((X*X' + reg*eye(1+inSize+resSize)) \ (X*Yt))'; 


%测试
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



