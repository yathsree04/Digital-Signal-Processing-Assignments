clc;
clear all;
close all;
env_det=0;
sync_det=1;
A=2;
message_f=4000;
[y, fs_voice ]=audioread('recording_converted.mp3');
duration_signal= length(y)/fs_voice;
%sound(y(:,1),fs_voice);
%keyboard;
%Play
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
   am_t=(m_t) .*cos(2.*pi.*fc.*t);
   N=length(m_t);
   m_f=fft(m_t)/N;
   am_f=fft(am_t)/length(am_t);
   freqaxis=linspace(-fs/2,fs/2,N);
   
   if env_det==1
       am_dem_t=hilbert(am_t).*exp(-1j*2*pi*fc.*t);
       am_dem_t=abs(am_dem_t)-A;
   end
   if sync_det==1
       am_dem_t=am_t.*cos(2*pi*fc.*t);
        t1=-40:1/(4*message_f):40;
        g_t=2*message_f*sinc(2*message_f*t1);
        am_dem_t=conv(am_dem_t,g_t,'same');
        am_dem_t=am_dem_t/1000;
   end
   am_dem_f=fft(am_dem_t)/(length(am_dem_t));
    figure(1)
    hold all;
    subplot(3,2,1);
    plot(t,m_t);
    xlabel('time(sec)');
    ylabel('Amplitude');
    title('Received signl TR');
    grid on;
    axis([0 inf -inf inf]);
    hold on;
    subplot(3,2,2);
    plot(freqaxis,fftshift(abs(m_f)));
    xlabel('frequency(Hz)');
    ylabel('Amplitude');
    title('Received signl FR');
    grid on;
    axis([-inf inf -inf inf]);
    hold on;
    subplot(3,2,3);
    plot(t,am_t);
    xlabel('time(sec)');
    ylabel('Amplitude');
    title('Modulated signl TR');
    grid on;
    axis([0 inf -inf inf]);
    hold on;
    subplot(3,2,4);
    plot(freqaxis,fftshift(abs(am_f)));
    xlabel('frequency(Hz)');
    ylabel('Amplitude');
    title('Modulated signl FR');
    grid on;
    axis([-inf inf -inf inf]);
    hold on;
    subplot(3,2,5);
    plot(t,am_dem_t);
    xlabel('time(sec)');
    ylabel('Amplitude');
    title('Demodulated signl TR');
    grid on;
    axis([0 inf -inf inf]);
    hold on;
    subplot(3,2,6);
    plot(freqaxis,fftshift(abs(am_dem_f)));
    xlabel('frequency(Hz)');
    ylabel('Amplitude');
    title('Demodulated signl FR');
    grid on;
    axis([-inf inf -inf inf]);
    pause(0.05);
end