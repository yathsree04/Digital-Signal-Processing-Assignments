tic
fs =3000;
t =-5:1/fs:5
m_t = sinc(t).*cos(2000*pi*t)
subplot(2,1,1)
plot(t,m_t)
xlabel('Time');
ylabel('Magnitude');
title('Time Domain');
subplot(2,1,2);
N = length(m_t)
freq_axis = linspace(-fs/2,fs/2,N);
plot(freq_axis , abs(fftshift((fft(m_t)/fs)))/N);
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency domain');
toc