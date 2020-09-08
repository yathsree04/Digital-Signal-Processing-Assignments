fs = 30;
f = 4;
F =-2*f: 1/fs :2*f
m_f = 2*rectpuls(F, 2*f);
T= 8
t =-2*T: 1/fs :2*T
m_t = 16*sinc(8*t);
y = rectpuls(t, 2*T);
convolution = conv(m_t,y , 'same');
subplot(2,1,1)
plot(t,convolution);
xlabel('time');
ylabel('Amplitude');
title('Time domain');
subplot(2,1,2)
N = length(convolution)
freq_axis = linspace(-fs/2,fs/2,N);
plot(freq_axis , abs(fftshift((fft(convolution)/fs)))/N);
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency domain');
xlim([-3 3]);

