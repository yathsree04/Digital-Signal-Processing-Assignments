%dial tone
Fc_1 = 350;
Fc_2 = 440;
Fs = 1000; %>=2Fc      
dt = 1/Fs;                                
t = (0:dt:2);
x_1 = sin(2*pi*Fc_1*t);
x_2 = sin(2*pi*Fc_2*t);
x = 0.1*(x_1 +x_2);
soundsc(x,Fs);
