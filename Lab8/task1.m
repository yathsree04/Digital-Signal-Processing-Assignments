f = 100
fs = 100*f
fc = 1000
duration = 30
t_lpf = -5:1/fs:5
t_lpf = t_lpf'
lpf = 2000*sinc(2000*t_lpf)

for i = 0:duration-1
   
    t = -(i+1):1/fs:i+1
   
    t = t'
   
    U = randi(5)
   
    m_t = 2*f*U*sinc(2*U*f*(t-i))

     
    n = length(m_t)
   
    fr = linspace(-fs/2,fs/2,n)
   
    fr = fr'
   
    m_f = fftshift(abs(fft(m_t)/n))
   
    c_s = 2*cos(2*pi*fc*t)
   
    mod_m_t = m_t.*c_s
   
    mod_m_f = fftshift(abs(fft(mod_m_t)/n))
   
    ssb = (conv(mod_m_t,lpf,'same'))
   
    ssb_f = fftshift(abs(fft(ssb)/n))
   
    demod_m_t = ssb.*(c_s)
   
    demod_m_f = fftshift(abs(fft(demod_m_t)/n))
         
    demod = (conv(demod_m_t,lpf,'same'))
   
    demod_f = fftshift(abs(fft(demod)/n))

       
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
    xlim([-2000 2000])
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
    xlim([-2000 2000])
    grid on
    subplot(4,2,5)
    plot(t,ssb)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('SSB')
    grid on
    hold all
    subplot(4,2,6)
    plot(fr,ssb_f)
    hold all
    xlabel ('frequency(hz)')
    ylabel ('amplitude')
    title ('SSB')
    xlim([-2000 2000])
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
    title ('De-modulated signal')
    xlim([-2000 2000])
    grid on
   
    pause(0.00001)
end