clear variables
close all % to close all plots
clc

% m-function [x,phi] = FDM_1D_s1(geom,BC,t)

geom.a = 0; % left boundary
geom.b = 1; % right boundary
geom.n = 11; % number of nodes

BC.a = 1000; % value of Dirichlet BC in a 
BC.b = 0; % value of Dirichlet BC in b

t = 5000; % forcing term

% call our function!
[x,phi] = FDM_1D_s1(geom,BC,t);

plot(x,phi,'o','LineWidth',2)
xlabel('x (m)')
ylabel('$\varphi$','Interpreter','latex')
fontsize(16,"points")
grid

% exact solution (for uniform t, Dirichlet BCs)
L = geom.b-geom.a;
phi_e = t/2*x.^2 + (BC.b-BC.a-t/2*L^2)/L*x + BC.a;

figure % create another plot
plot(x,phi,'o',...
    x,phi_e,'x','LineWidth',2)
xlabel('x (m)')
ylabel('$\varphi$','Interpreter','latex')
fontsize(16,"points")
grid 
legend('FDM','Exact')

% absolute error
figure
err = abs(phi_e'-phi);
plot(x,err,'s','LineWidth',2)
xlabel('x (m)')
ylabel('$|\varphi_e - \varphi |$','Interpreter','latex')
fontsize(16,"points")
grid

% notice: no truncation error -> FDM 2nd order accurate finite differences
% and analytical solution is a second-order polynomial -> no error due to
% truncation of taylor series
% only source of error: roundoff

%% Implementation of Neumann BCs
clear variables

% reference
geom.a = 0; % left boundary
geom.b = 1; % right boundary
geom.n = 21; % number of nodes
BC.a = 1; % value of Dirichlet BC in a
BC.b = 1; % value of Dirichlet BC in b
t = 10; % forcing term
[x_full,phi_full] = FDM_1D_s1(geom,BC,t);

% half-domain
clear BC; % to clear the structure

geom.a = 0; % left boundary
geom.b = 0.5; % right boundary
geom.n = 11; % number of nodes
BC.a.val = 1; % value of BC in a 
BC.a.type = 'D'; % Dirichlet
BC.b.val = 0; % value of Dirichlet BC in b
BC.b.type = 'N'; % value of Neumann BC in b
t = 10; % forcing term
[x_half,phi_half] = FDM_1D_s2(geom,BC,t);
figure

plot(x_full,phi_full,'o',x_half,phi_half,'x')
xlabel('x (m)')
ylabel('$\varphi$','Interpreter','latex')
fontsize(16,"points")

% computation of gradient (from half-solution)
% take x, phi -> apply dphi_dx = ...
dx = (geom.b-geom.a) / (geom.n-1);

% with a for loop
dphi_dx = zeros(size(phi_half));
% internal nodes
for k = 2:length(phi_half)-1
    dphi_dx(k) = (phi_half(k+1)-phi_half(k-1)) / (2*dx);
end
% left boundary
dphi_dx(1) = (phi_half(2)-phi_half(1))/dx;
% right boundary
dphi_dx(end) = (phi_half(end)-phi_half(end-1))/dx;

% exact expression (works for Dirichlet BCs)
geom.a = 0; % left boundary
geom.b = 1; % right boundary
L = geom.b-geom.a;
BC.a.val = 1; 
BC.a.type = 'D';
BC.b.val = 1;
BC.b.type = 'D';
dphi_dx_e = t*x_full + (BC.b.val-BC.a.val-t/2*L^2)/L;

plot(x_full,dphi_dx_e,'o',x_half,dphi_dx,'x','LineWidth',2)
legend('Exact','Numerical')
fontsize(16,"points")
xlabel('x (m)');
ylabel('$\frac{d \varphi}{d x}$','Interpreter','latex')

% notice: truncation error at boundaries of derivative on half domain
% -> justifies implementation of 2nd-order formulas for boundaries

% also interesting: to implement possibility of using non-uniform t -> t(x)
% need to switch from t -> t(k) in for loops when assembling [K],{rhs}

% recall: phi -> electrostatic potential, t -> rho/eps_0, dphi_dx = -E