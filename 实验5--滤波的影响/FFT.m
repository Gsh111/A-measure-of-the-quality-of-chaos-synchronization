
%S_RF=s(end-20e4:end);
%Fs = 40e9;                      % sample rate, Hz
S_RFx=x1(end-100000:end);    %����Ƶ�׷������ź�
%S_RFx=a';
Fs = 40e9;            %����Ƶ��
Npoints = length(S_RFx);
FFT_Ex_1 = fftshift(fft(S_RFx));   %�źŵĸ���Ҷ�任
FFT_Ex = abs(FFT_Ex_1)./(length(S_RFx));
Frek = (Fs*(-(Npoints)/2:((Npoints/2)-1)))/Npoints;   %�������Ƶ��
% subplot(2,2,3); 
figure(5)
plot(Frek./1e9, 10*log10(FFT_Ex.^2),'b');
% xlim([0*1e3 0.1*1e3]) ;
title('Spectrum of the received signal after downconversion');
xlabel('Frequency, GHz');
ylabel('Power, dB');

% %������Ч����
 b=effbandt1(Frek,FFT_Ex) ;       % b��2����Ч����
 band=b*2
