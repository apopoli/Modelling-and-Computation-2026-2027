clear variables
clc
close all % closes all figures

f = @(x) 2*x.^4 + 3*x.^3 + x.^2 + 0.5*x + 3; % remember dot-operator (element-wise operations)
df_dx = @(x) 8*x.^3 + 9*x.^2 + 2*x + 0.5; % analytical derivative

x = 1; % evaluation point

fprintf('df_dx(1) = %g \n',df_dx(x))

dx = 1e-12; % spacing

% forward formula
df_dx_FW = @(x,dx) (f(x+dx) - f(x))./dx;
fprintf('df_dx_FW(1) = %15.12g \n',df_dx_FW(x,dx))

% backward formula
df_dx_BW = @(x,dx) (f(x) - f(x-dx))./dx;
fprintf('df_dx_BW(1) = %15.12g \n',df_dx_BW(x,dx))

% centered
df_dx_C = @(x,dx) (f(x+dx) - f(x-dx))./(2*dx);
fprintf('df_dx_C(1) = %15.12g \n',df_dx_C(x,dx))

% dx = 1e-2
% df_dx(1) = 19.5 
% df_dx_FW(1) = 19.7211 
% df_dx_BW(1) = 19.2811 
% df_dx_C(1) =    19.5011 

% dx = 1e-3
% df_dx(1) = 19.5 
% df_dx_FW(1) = 19.522 
% df_dx_BW(1) = 19.478 
% df_dx_C(1) =  19.500011 

% dx = 1e-6
% df_dx(1) = 19.5 
% df_dx_FW(1) =   19.5000219989 
% df_dx_BW(1) =   19.4999780003 
% df_dx_C(1) =   19.4999999996 

% dx = 1e-12
% df_dx(1) = 19.5 
% df_dx_FW(1) =   19.5008453829 
% df_dx_BW(1) =   19.5008453829 
% df_dx_C(1) =   19.5008453829 

% question: behavior when dx goes to zero. Experiments show non-monotonic
% behavior

% plot numerical derivatives in x = 1 vs analytical solution for dx from
% 1e-12 to 1e-3

dx = logspace(-12,-3,1000);

semilogx(dx,ones(size(dx))*df_dx(x),'--',...
    dx,df_dx_FW(x,dx),...
    dx,df_dx_BW(x,dx),...
    dx,df_dx_C(x,dx),'LineWidth',2)
legend('Analyical','FW','BW','C')
xlabel('dx')
ylabel('df/dx')
grid on
fontsize(16,"points")

% on the right (for large dx) -> error dominated by truncation (missing
% part in Taylor series)
% on the left (for small dx) -> error dominated by roundoff (numerical
% cancellation)

% relative error
err_FW = @(x,dx) abs( (df_dx(x) - df_dx_FW(x,dx))/df_dx(x) );
err_BW = @(x,dx) abs( (df_dx(x) - df_dx_BW(x,dx))/df_dx(x) );
err_C = @(x,dx) abs( (df_dx(x) - df_dx_C(x,dx))/df_dx(x) );

figure
loglog(dx,err_FW(x,dx),...
    dx,err_BW(x,dx),...
    dx,err_C(x,dx),'LineWidth',2)
legend('FW','BW','C')
xlabel('dx')
ylabel('relative error (df/dx)')
grid on
fontsize(16,"points")

% try to repeat the exercise with a second-order polynomial function as
% f(x). E.g.: f = @(x) x.^2 + 0.5*x + 3; 
% Try to explain the observed behavior
% Hint: think to taylor series