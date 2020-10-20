[y, Fs] = audioread('recording_converted.mp3');
duration_sig = 59;
f_c = 500;
z =amdemod(y,f_c, Fs, 0, 1);

for T = 0:duration_sig
    
    t = T:1/Fs:(1+T);
    M_f = fft(z)/length(z);
    f = linspace(-Fs/2, Fs/2, length(z));
    
    figure()
    subplot(211);
    plot(z);
    
    subplot(212)
    plot(f,fftshift(abs(M_f)));
    %modulated sound 
    sound(z, Fs);
    %original sound
    sound(y, Fs);
    
end