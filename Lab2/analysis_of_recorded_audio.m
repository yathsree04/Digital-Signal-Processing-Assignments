[y,Fs] = audioread('recording_converted.mp3');   
%sound(y,Fs);                               % listen your audio input
% disp(Fs);   Fs = 44100 Hz
N = length(y);                             % sample length

slength = N/Fs;                            % total time span of audio signal

x_t = linspace(0, N/Fs, N);

figure(1)
plot(x_t, y);                                % plots time domain

x_f = fft(y,N);     
f_axis_x = linspace(-Fs/2, Fs/2, N);
title('time domain');
ylabel('Magnitude');
xlabel('sample');
legend('Voice Signal');
grid on;

figure(2);
plot(f_axis_x/1000,10*log10(fftshift(abs(x_f))));  
title('frequency spectrum');
xlabel('frequency in Khz');%frequency spectrum 
ylabel('Amplitude in db');

display('My voice frequency lies in 1Khz');
display('My bandwidth is 3Khz');