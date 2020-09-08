Fs = 100;              %>2Fc      
dt = 1/Fs;                                
t = (0:dt:1)';     
Fc = 10;                     
x = sin(2*pi*Fc*t);
len = length(x);
f = (0 : len-1)/len
plot(f,abs(fft(x)));
