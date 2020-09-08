Fs = 70;              %>2Fc      
dt = 1/Fs;                                
t = (0:dt:1)';     
Fc = 10;                     
x = sin(2*pi*Fc*t);
plot(t,x);
