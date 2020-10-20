
f = 5
fs = 1000*f
fc = 500
duration = 30
t_lpf = -5:1/fs:5
lpf = 100*sinc(100*t_lpf)

for i = 0:duration-1
   
    t = i:1/fs:i+1
   
    U = randi(5)
   
    m_t = cos(2*pi*U*f*t)
     
    n = length(m_t)
   
    fr = linspace(-fs/2,fs/2, n)
   
    m_f = fftshift(abs(fft(m_t)/n))
   
    c_s = cos(2*pi*fc*t)
   
    mod_m_t = m_t.*c_s
   
    mod_m_f = fftshift(abs(fft(mod_m_t)/n))
   
    demod_m_t = mod_m_t.*(2*c_s)
   
    demod_m_f = fftshift(abs(fft(demod_m_t)/n))
   
    demod = 2*(conv(demod_m_t,lpf,'same'))
   
    demod_f = fftshift(abs(fft(demod)/n))
   
    y_t = hilbert(mod_m_t).*exp(-2*j*pi*fc*t)
   
    y_f = fftshift(abs(fft(y_t)/n))
   
   
   
    figure(1)
   
    subplot(4,2,1)
    plot(t,m_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('Message signal')
    grid on
    hold all
    subplot(4,2,2)
    plot(fr,m_f)
    hold all
    xlabel ('frequency(hz)')
    ylabel ('amplitude')
    title ('Message signal')
    grid on
    subplot(4,2,3)
    plot(t,mod_m_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('Modulated signal')
    grid on
    hold all
    subplot(4,2,4)
    plot(fr,mod_m_f)
    hold all
    xlabel ('frequency(hz)')
    ylabel ('amplitude')
    title ('Modulated signal')
    grid on
    subplot(4,2,5)
    plot(t,demod_m_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('De-modulated signal')
    grid on
    hold all
    subplot(4,2,6)
    plot(fr,demod_m_f)
    hold all
    xlabel ('frequency(hz)')
    ylabel ('amplitude')
    title ('De-modulated signal(without LPF)')
    grid on
    subplot(4,2,7)
    plot(t,demod)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('De-modulated signal')
    grid on
    hold all
    subplot(4,2,8)
    plot(fr,demod_f)
    hold all
    xlabel ('frequency(hz)')
    ylabel ('amplitude')
    title ('De-modulated signal(after LPF)')
    pause(0.05)
end