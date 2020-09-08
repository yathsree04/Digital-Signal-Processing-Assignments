%ringing tone 
Fc_3 = 440;
Fc_4 = 480;
Fs_1 = 1000  %>=2Fc ;
dt_1 = 1/Fs_1;
t_1 = (0:dt_1:2);
t_2 = (0: dt_1:4);
x_3 = sin(2*pi*Fc_3*t_1);
x_4 = sin(2*pi*Fc_4*t_1);
x_ring = .1*(x_4+x_3);
zero = 0*sin(2*pi*Fs_1*t_2);
cat = horzcat(x_ring,zero);
Y = repmat(cat,1,5);
soundsc(Y,Fs_1);