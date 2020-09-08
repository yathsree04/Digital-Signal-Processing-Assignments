function [m_t , m_f] = rect_puls( T, flag)
fs = 30;
t =-2*T:1/fs:2*T
m_t = rectpuls(t, 2*T);
m_f = fftshift((fft(m_t)/fs));
N = length(m_t);
hold all
if(flag == 1)
subplot(2,1,1), plot  (t,m_t);
xlabel('Time')
ylabel('Magnitude');
title('Time Response');
freq_axis = linspace(-fs/2,fs/2,N);
hold all 
subplot(2,1,2), plot(freq_axis , abs(m_f));
xlabel('Frequency')
ylabel('Magnitude');
title('Frequency Response')
xlim([-1.5 1.5]);
end
end