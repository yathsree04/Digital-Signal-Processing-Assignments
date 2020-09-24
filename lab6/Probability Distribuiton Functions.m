normal_fn = @ (x) (1/(sqrt(2*pi))*(exp((-x.^2)/2)))   
integral(normal_fn, -inf, inf)   %1.0000
 
mean_normal = @ (x) x.*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))  
integral(mean_normal, -inf, inf)    %1.9023e-17
 
variance_normal = @ (x) (x.^2).*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))
integral(variance_normal, -inf, inf)   %1.0000
P_normal = integral(normal_fn, 1, inf)   %0.1587
qfunc(1)                                 %0.1587
 
figure(1)
x = -10:0.1:10;
normal_plot = (1/(sqrt(2*pi))*(exp((-x.^2)/2)));
plot(x,normal_plot)
 
xlabel('PDF distribution of Normal distribution')
ylabel('Probability P(x)')
 

% RAYLEIGH DISTRIBUTION
 
rayleigh_fn = @ (x) (x/2).*(exp((-1*(x).^2)/4))
integral(rayleigh_fn, 0, inf)     %1.0000
 
mean_rayleigh = @ (x) x.*(x/2).*(exp((-1*(x).^2)/4))
integral(mean_rayleigh, 0, inf)     %1.7725
 
variance_rayleigh = @ (x) (x.^2).*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))
integral(variance_rayleigh, 0, inf)   %0.5000
P_rayleigh = integral(rayleigh_fn, 1, inf)    %0.7788
qfunc(1)                                      %0.1587
 
figure(2)
x = 0:0.1:10;
rayleigh_plot = (x/2).*(exp((-1*(x).^2)/4));
plot(x,rayleigh_plot)
 
xlabel('PDF distribution of Rayleigh distribution')
ylabel('Probability P(x)')
 
% EXPONENTIAL FUNCTION
 
exponential_fn = @ (y) 3*(exp((-y).*(3)))
integral(exponential_fn, 0, inf)             %1
 
mean_exponential = @ (y) y.*(3*(exp(y.*(-3))))
integral(mean_exponential, 0, inf)            %0.3333
 
variance_exponential = @ (y) (y.^2).*(3*(exp(y.*(-3))))
integral(variance_exponential, 0, inf)              %0.2222
P_exponential = integral(exponential_fn, 1, inf)    %0.0498
 
figure(3)
y = -10:0.1:10;
exponential_plot = 3*(exp((-y).*(3)));
plot(y,exponential_plot)
 
xlabel('PDF distribution of Exponential distribution')
ylabel('Probability P(y)')
 
% UNIFORM FUNCTION
 
uniform_fn = @ (y) (y.^0).*((1)/(3));
integral(uniform_fn, 1, 4)                %1.0000
 
mean_uniform = @ (y) y.*(y.^0).*((1)/(3))
integral(mean_uniform, 1, 4)              %2.5000
 
variance_uniform = @ (y) (y.^2).*(y.^0).*(( 1)/(3))
integral(variance_uniform, 0, inf)         %7.0000
P_uniform = integral(uniform_fn, 1, 4)     %1.0000
 
figure(4)
y = 1:0.1:4;
uniform_plot = (y.^0).*((1)/(3));
plot(y,uniform_plot)
 
xlabel('PDF distribution of Uniform distribution')
ylabel('Probability P(y)')
normal_fn = @ (x) (1/(sqrt(2*pi))*(exp((-x.^2)/2)))   
integral(normal_fn, -inf, inf)   %1.0000
 
mean_normal = @ (x) x.*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))  
integral(mean_normal, -inf, inf)    %1.9023e-17
 
variance_normal = @ (x) (x.^2).*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))
integral(variance_normal, -inf, inf)   %1.0000
P_normal = integral(normal_fn, 1, inf)   %0.1587
qfunc(1)                                 %0.1587
 
figure(1)
x = -10:0.1:10;
normal_plot = (1/(sqrt(2*pi))*(exp((-x.^2)/2)));
plot(x,normal_plot)
 
xlabel('PDF distribution of Normal distribution')
ylabel('Probability P(x)')
 

% RAYLEIGH DISTRIBUTION
 
rayleigh_fn = @ (x) (x/2).*(exp((-1*(x).^2)/4))
integral(rayleigh_fn, 0, inf)     %1.0000
 
mean_rayleigh = @ (x) x.*(x/2).*(exp((-1*(x).^2)/4))
integral(mean_rayleigh, 0, inf)     %1.7725
 
variance_rayleigh = @ (x) (x.^2).*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))
integral(variance_rayleigh, 0, inf)   %0.5000
P_rayleigh = integral(rayleigh_fn, 1, inf)    %0.7788
qfunc(1)                                      %0.1587
 
figure(2)
x = 0:0.1:10;
rayleigh_plot = (x/2).*(exp((-1*(x).^2)/4));
plot(x,rayleigh_plot)
 
xlabel('PDF distribution of Rayleigh distribution')
ylabel('Probability P(x)')
 
% EXPONENTIAL FUNCTION
 
exponential_fn = @ (y) 3*(exp((-y).*(3)))
integral(exponential_fn, 0, inf)             %1
 
mean_exponential = @ (y) y.*(3*(exp(y.*(-3))))
integral(mean_exponential, 0, inf)            %0.3333
 
variance_exponential = @ (y) (y.^2).*(3*(exp(y.*(-3))))
integral(variance_exponential, 0, inf)              %0.2222
P_exponential = integral(exponential_fn, 1, inf)    %0.0498
 
figure(3)
y = -10:0.1:10;
exponential_plot = 3*(exp((-y).*(3)));
plot(y,exponential_plot)
 
xlabel('PDF distribution of Exponential distribution')
ylabel('Probability P(y)')
 
% UNIFORM FUNCTION
 
uniform_fn = @ (y) (y.^0).*((1)/(3));
integral(uniform_fn, 1, 4)                %1.0000
 
mean_uniform = @ (y) y.*(y.^0).*((1)/(3))
integral(mean_uniform, 1, 4)              %2.5000
 
variance_uniform = @ (y) (y.^2).*(y.^0).*(( 1)/(3))
integral(variance_uniform, 0, inf)         %7.0000
P_uniform = integral(uniform_fn, 1, 4)     %1.0000
 
figure(4)
y = 1:0.1:4;
uniform_plot = (y.^0).*((1)/(3));
plot(y,uniform_plot)
 
xlabel('PDF distribution of Uniform distribution')
ylabel('Probability P(y)')
normal_fn = @ (x) (1/(sqrt(2*pi))*(exp((-x.^2)/2)))   
integral(normal_fn, -inf, inf)   %1.0000
 
mean_normal = @ (x) x.*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))  
integral(mean_normal, -inf, inf)    %1.9023e-17
 
variance_normal = @ (x) (x.^2).*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))
integral(variance_normal, -inf, inf)   %1.0000
P_normal = integral(normal_fn, 1, inf)   %0.1587
qfunc(1)                                 %0.1587
 
figure(1)
x = -10:0.1:10;
normal_plot = (1/(sqrt(2*pi))*(exp((-x.^2)/2)));
plot(x,normal_plot)
 
xlabel('PDF distribution of Normal distribution')
ylabel('Probability P(x)')
 

% RAYLEIGH DISTRIBUTION
 
rayleigh_fn = @ (x) (x/2).*(exp((-1*(x).^2)/4))
integral(rayleigh_fn, 0, inf)     %1.0000
 
mean_rayleigh = @ (x) x.*(x/2).*(exp((-1*(x).^2)/4))
integral(mean_rayleigh, 0, inf)     %1.7725
 
variance_rayleigh = @ (x) (x.^2).*(1/(sqrt(2*pi))*(exp((-x.^2)/2)))
integral(variance_rayleigh, 0, inf)   %0.5000
P_rayleigh = integral(rayleigh_fn, 1, inf)    %0.7788
qfunc(1)                                      %0.1587
 
figure(2)
x = 0:0.1:10;
rayleigh_plot = (x/2).*(exp((-1*(x).^2)/4));
plot(x,rayleigh_plot)
 
xlabel('PDF distribution of Rayleigh distribution')
ylabel('Probability P(x)')
 
% EXPONENTIAL FUNCTION
 
exponential_fn = @ (y) 3*(exp((-y).*(3)))
integral(exponential_fn, 0, inf)             %1
 
mean_exponential = @ (y) y.*(3*(exp(y.*(-3))))
integral(mean_exponential, 0, inf)            %0.3333
 
variance_exponential = @ (y) (y.^2).*(3*(exp(y.*(-3))))
integral(variance_exponential, 0, inf)              %0.2222
P_exponential = integral(exponential_fn, 1, inf)    %0.0498
 
figure(3)
y = -10:0.1:10;
exponential_plot = 3*(exp((-y).*(3)));
plot(y,exponential_plot)
 
xlabel('PDF distribution of Exponential distribution')
ylabel('Probability P(y)')
 
% UNIFORM FUNCTION
 
uniform_fn = @ (y) (y.^0).*((1)/(3));
integral(uniform_fn, 1, 4)                %1.0000
 
mean_uniform = @ (y) y.*(y.^0).*((1)/(3))
integral(mean_uniform, 1, 4)              %2.5000
 
variance_uniform = @ (y) (y.^2).*(y.^0).*(( 1)/(3))
integral(variance_uniform, 0, inf)         %7.0000
P_uniform = integral(uniform_fn, 1, 4)     %1.0000
 
figure(4)
y = 1:0.1:4;
uniform_plot = (y.^0).*((1)/(3));
plot(y,uniform_plot)
 
xlabel('PDF distribution of Uniform distribution')
ylabel('Probability P(y)')
