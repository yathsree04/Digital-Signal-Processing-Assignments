%%%% Part A
f = 10^6
d = [.1:.1:2]

for i = 1:length(d)
R = (409^4+.3822*f^2)^.25
L = (607*10^-6+500*10^-6*(f/609000)^5.269)/(1+(f/609000)^5.269)
G = 0
C = 40*10^-9
gamma = ((R+j*2*pi*f*L)*(j*2*pi*f*C))^.5
H_f(i) = exp(-1*gamma*d(i))
H_db(i) = 10*log10(abs(H_f(i)))
end

figure(1)
plot(d,H_db);
title('Gain vs Distance for 1MHz freq');
xlabel('Distance(km)');
ylabel('Gain(db)');
grid on 

%%%% Part B

d = 1
f = [1:500:10000]

for i = 1:20
R = (409^4 + .3822*(f(i)*1000)^2)^.25
L = (607*10^-6 + 500*10^-6*(f(i)/609)^5.269)/(1+(f(i)/609)^5.269)
G = 0
C = 40*10^-9
gamma = ((R+j*2*pi*f(i)*1000*L)*(j*2*pi*f(i)*1000*C))^.5
H_f(i) = exp(-1*gamma*d)
H_db(i) = 10*log10(abs(H_f(i)))
end

figure(2)
plot(f,H_db);
title('Gain vs Frequency for 1km distance');
xlabel('Frequency (KHz)');
ylabel('Gain (db)');
grid on 







