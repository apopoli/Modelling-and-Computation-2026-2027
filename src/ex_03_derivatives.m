clear variables
clc

f = @(x) 2*x.^4 + 3*x.^3 + x.^2 + 0.5*x + 3; % remember dot-operator (element-wise operations)
df_dx = @(x) 8*x.^3 + 9*x.^2 + 2*x + 0.5; % analytical derivative

x = 1; % evaluation point

fprintf('df_dx(1) = %g \n',df_dx(x))

dx = 1e-3;

% forward formula
df_dx_FW = @(x,dx) (f(x+dx) - f(x))/dx;
fprintf('df_dx_FW(1) = %g \n',df_dx_FW(x,dx))

% backward formula
df_dx_BW = @(x,dx) (f(x) - f(x-dx))/dx;
fprintf('df_dx_BW(1) = %g \n',df_dx_BW(x,dx))

% centered
df_dx_C = @(x,dx) (f(x+dx) - f(x-dx))/(2*dx);
fprintf('df_dx_C(1) = %10.8g \n',df_dx_C(x,dx))