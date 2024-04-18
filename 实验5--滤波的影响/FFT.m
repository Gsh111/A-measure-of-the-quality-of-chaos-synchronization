
%S_RF=s(end-20e4:end);
%Fs = 40e9;                      % sample rate, Hz
S_RFx=x1(end-100000:end);    %进行频谱分析的信号
%S_RFx=a';
Fs = 40e9;            %采样频率
Npoints = length(S_RFx);
FFT_Ex_1 = fftshift(fft(S_RFx));   %信号的傅里叶变换
FFT_Ex = abs(FFT_Ex_1)./(length(S_RFx));
Frek = (Fs*(-(Npoints)/2:((Npoints/2)-1)))/Npoints;   %计算采样频率
% subplot(2,2,3); 
figure(5)
plot(Frek./1e9, 10*log10(FFT_Ex.^2),'b');
% xlim([0*1e3 0.1*1e3]) ;
title('Spectrum of the received signal after downconversion');
xlabel('Frequency, GHz');
ylabel('Power, dB');

% %计算有效带宽
 b=effbandt1(Frek,FFT_Ex) ;       % b乘2是有效带宽
 band=b*2
