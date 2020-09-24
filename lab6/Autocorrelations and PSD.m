gauss =   random('Normal', 0 , 1 , 1000000,1)
rayl = random('Rayleigh',2, 1000000,1)
exp = random('Exponential',3,1000000,1)
unif = random('Uniform',1,4,1000000,1)
figure(1)
hist(gauss)
title(['Gaussian Distribution']);
xlabel(['Bins']);
ylabel(['Magnitude']);
figure(2)
hist(rayl)
title(['Rayleigh Distribution']);
xlabel(['Bins']);
ylabel(['Magnitude']);
figure(3)
hist(exp)
title(['Exponential Distribution']);
xlabel(['Bins']);
ylabel(['Magnitude']);
figure(4)
hist(unif)
title(['Uniform Distribution']);
xlabel(['Bins']);
ylabel(['Magnitude']);


gauss =   random('Normal', 0 , sqrt(10) , 1000000,1)
[c,lags] = xcorr(gauss);
plot(lags,c)
title(['Autocorrelation'])
xlabel(['lags'])
ylabel(['Magnitude']);

Fs = 100;
dt = 1/Fs;

t = 0:dt:1;

xf = 0;
numb = 1e6;
for i=1:numb

    n1 = random('Normal',0,sqrt(10),length(t),1);
    
    n1f = fft(n1)/length(t);
    n1f = fftshift(abs(n1f).^2);
    
    xf = xf + n1f;
    
end

f_axis = linspace(-Fs/2,Fs/2,length(t));

figure(3);
plot(f_axis,10*log10(xf/numb));
title('PSD of the Gassian Distribution');
xlabel('Frequency(Hz)');
ylabel('Magnitude');



