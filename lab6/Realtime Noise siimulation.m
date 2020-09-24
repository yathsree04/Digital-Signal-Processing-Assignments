f = 5
fs = 10*f
duration = 30

U2 = randi(3)

for i = 0:duration-1
    
    t = i:1/fs:i+1
    
    U1 = randi(5)
    m1_t = U1*cos(2*pi*f*t)
    n = length(m1_t)
    fr = linspace(-fs/2,fs/2, n)
    m1_f = fftshift(abs(fft(m1_t)/n))
    
    figure(1)
    subplot(2,1,1)
    plot(t,m1_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    grid on 
    hold all
    subplot(2,1,2)
    plot(fr,m1_f)
    hold all
    xlabel ('frequency(hz)')
    ylabel ('amplitude')
    grid on
    pause(0.2)
end

%% task3.2

for i = 0:duration-1
    
    t = i:1/fs:i+1
    
    U2 = randi(3)
    noise_mean = 0
    noise_variance = 1
    
    m2_t = cos(2*pi*U2*f*t)+ (noise_variance*randn(1, length(t))+ noise_mean)
    n = length(m2_t)
    fr = linspace(-fs/2,fs/2, n)
    m2_f = fftshift(abs(fft(m2_t)/n))
    
    figure(2)
    subplot(2,1,1)
    plot(t,m2_t)
    xlabel ('time(s)')
    ylabel ('amplitude')
    grid on 
    hold all
    subplot(2,1,2)
    plot(fr,m2_f)
    hold all
    xlabel ('frequency(hz)')
    ylabel ('amplitude')
    grid on
    pause(0.2)
end