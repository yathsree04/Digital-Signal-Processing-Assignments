d = [100: 100 :2000] 
c = 3*10^8
f1 = 900*10^6 
f2 = 2.4*10^9
for k = 1 : length(d)
    Pr_1(k) = c^2/(f1^2*16*(3.14)^2*d(k)^2)
    Pr_1_dbm(k) = 10*log10(abs(Pr_1(k))*10^3)
    Pr_2(k) = c^2/(f2^2*16*(3.14)^2*d(k)^2)
    Pr_2_dbm(k) = 10*log10(abs(Pr_2(k))*10^3)
end
p1 = plot(d,Pr_1_dbm)
title('Power Received vs Distance')
xlabel('Distance (m)')
ylabel('Power Received (dBm)')
grid on
hold on
p2 = plot(d,Pr_2_dbm)
h = [p1;p2]
legend(h,'900MHz','2.4GHz');

% Task 2 extension

% for -90db P = 10-12 W (1pW)
f = f1
P = 10^-12
d_1 = c/(f*4*pi*P^.5)          %p in watts

