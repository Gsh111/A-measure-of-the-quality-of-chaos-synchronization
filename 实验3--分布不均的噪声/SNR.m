
function snr=SNR(I,In)
% ��������Ⱥ���
% I :original signal   ԭʼ�ź�
% In:noisy signal(ie. original signal + noise signal)   �����ź�
snr=0;
Ps=sum(sum((I-mean(mean(I))).^2));%signal power  7.3931e+03
Pn=sum(sum((I-In).^2));           %noise power
snr=10*log10(Ps/Pn);

