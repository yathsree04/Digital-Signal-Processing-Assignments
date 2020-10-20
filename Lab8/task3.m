clc;
clear all;
close all;
env_det=0;
sync_det=1;
A=0;
message_f=4000;
[y, fs_voice ]=audioread('recording_converted.mp3');
duration_signal= length(y)/fs_voice;
for T = 1:duration_signal/1 %%%% Duration 30 seconds with interval of 1 sec.
    if T==0
        disp('Transmission Started')
        disp (T)
    elseif (T==duration_signal)
        disp('Transmission Finished')
        disp(T)
    else
        disp('Transmission in progress....')
        disp(T)
    end
   
    fc=10000;
    fs=8*(10^6);
    ts=1/fs;
    L=fs_voice;
    t = (T-1)*ts*L:ts:L*ts*(T)-ts;
    t=t';
    m_t=y(:,1);
   
 if T==1
      m_t=m_t(1:L);      
 else
  m_t=m_t((T-1)*L:T*L-1);
 end
gt = 1;
gr = 1;
lambda = 1;
d = 1;
ht = sqrt(gt*gr*lambda^2/(4*pi*d*d));
nt = 0.1*randn(1, length(t));
lpf = 100*sinc(100*t)
    %passing modulated signal through channel
    mod_m_t = (m_t).*cos(2.*pi.*fc.*t);
    mod_m_trans = mod_m_t*ht;
    k = 1;
    mod_m_t_c = k*mod_m_trans;
   
    mod_m_f = fftshift(abs(fft(mod_m_t_c)/(length(m_t))))
   demod_m_t=mod_m_t_c.*cos(2*pi*fc.*t);
    demod_m_t=hilbert(demod_m_t).*exp(-1j*2*pi*fc.*t);
     demod_m_t=abs(demod_m_t)-A;
   
    demod_m_f = fftshift(abs(fft(demod_m_t)/(length(m_t))))
   
    demod = 2*(conv(demod_m_t,lpf,'same'))
   
    demod_f = fftshift(abs(fft(demod)/length(m_t)))
   
    y_t = hilbert(mod_m_t_c).*exp(-2*j*pi*fc*t)
   
    %%% adding noise
    
    y_t = y_t + nt
    y_f = fftshift(abs(fft(y_t)/n))
    
    % noise with changed variance
    n1_t =0.1*normrnd(0,5);
    y1_t = y_t + n1_t
   
    
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
end