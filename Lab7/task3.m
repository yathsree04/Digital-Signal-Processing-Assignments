gt = 1;
gr = 1;
lambda = 1;
d = 1;
ht = sqrt(gt*gr*lambda^2/(4*pi*d*d));
nt = 0.1*randn(1, length(t));
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
    
    %passing modulated signal through channel
    mod_m_trans = mod_m_t*ht;
    %increasing power of transmitted signal;
    k = 4;
    mod_m_t_c = k*mod_m_trans;
   
    mod_m_f = fftshift(abs(fft(mod_m_t_c)/n))
   
    demod_m_t = mod_m_t_c.*(2*c_s)
   
    demod_m_f = fftshift(abs(fft(demod_m_t)/n))
   
    demod = 2*(conv(demod_m_t,lpf,'same'))
   
    demod_f = fftshift(abs(fft(demod)/n))
   
    y_t = hilbert(mod_m_t_c).*exp(-2*j*pi*fc*t)
   
    %%% adding noise
    
    y_t = y_t + nt
    y_f = fftshift(abs(fft(y_t)/n))
    
    % noise with changed variance
    n1_t =0.1*normrnd(0,5);
    y1_t = y_t + n1_t
    
    end
    
    %plotting
    subplot(2 ,2,1)
    plot(t,mod_m_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('Modulated signal')
    subplot(2,2,2)
    plot(t,mod_m_trans)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('Transmitted signal through channel')
    subplot(2,2,3)
    plot(t,mod_m_t_c)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('Transmitted signal through channel  with increased power')
    subplot(2,2,4)
    plot(t,y_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('Received power with added noise')
    figure
    plot(t,y1_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    title ('Added noise with variance 5')
    
