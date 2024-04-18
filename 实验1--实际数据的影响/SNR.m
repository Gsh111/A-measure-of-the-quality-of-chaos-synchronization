
function snr=SNR(I,In)
% 计算信噪比函数
% I :original signal   原始信号
% In:noisy signal(ie. original signal + noise signal)   噪声信号
snr=0;
Ps=sum(sum((I-mean(mean(I))).^2));%signal power  7.3931e+03
Pn=sum(sum((I-In).^2));           %noise power
snr=10*log10(Ps/Pn);

