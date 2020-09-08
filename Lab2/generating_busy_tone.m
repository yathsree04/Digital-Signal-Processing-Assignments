%busy tone
Fc_1 = 480;
Fc_2 = 620;
Fs = 2000; %>=2Fc      
dt = 1/Fs;                                
t = (0:dt:1.5); %on time     %updated time 
t_1 = (0 :dt:1.5) %off time  %updated time
x_3 = sin(2*pi*Fc_1*t);
x_4 = sin(2*pi*Fc_2*t);
x_ring = .1*(x_4+x_3);
zero = 0*sin(2*pi*Fs*t_1);
cat = horzcat(x_ring,zero);
Y = repmat(cat,1,5);
soundsc(Y,Fs);
