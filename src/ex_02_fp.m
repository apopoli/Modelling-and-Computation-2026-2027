clc
clear variables

% basic output
disp('Machine precision:')
disp(eps);

% more
fprintf('Machine precision is %g \n',eps) % %g: default format (switches automatically between scientific and standard)
fprintf('Machine precision is %f \n',eps) % %f: without scientific notation

% for more digits
fprintf('One third is: %10.9f \n',1/3) %

% largest number (realmax)
fprintf('Largest number is %g \n',realmax)

% smallest number (realmin)
fprintf('Smallest number is %g \n',realmin)

x = 0:0.01:10; % from 0 to 10, steps of 0.1
x = linspace(0,10,1000); % alternative

y = zeros(size(x)); % array of zeros with same size of x

% three ways to define y = f(x)
for i = 1:length(x)
    y(i) = ((x(i) + 1) - 1) / x(i);
end

% y defined with a vectorized expression
y = ((x + 1) - 1) ./ x; % ./ element-wise division

% anonymous functions
y = @(x) ((x + 1) - 1) ./ x;

plot(x,y(x))

% set the limits for the y-axis
ylim([0.99 1.01])