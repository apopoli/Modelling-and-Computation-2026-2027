clear variables
close all
clc

% 2D-FDM solver for a Poisson-type PDE
% div(grad(phi)) = t

t = -1; % source term for PDE

nx = 25; % points along x
ny = 25; % points along y

Lx = 1; % domain lenght along x
Ly = 1; % domain length along y

x0 = 0;
x = linspace(x0,Lx,nx); % nx values from x0 to Lx, linearly spaced 

y0 = 0;
y = linspace(y0,Ly,ny); % ny values from y0 to Ly, linearly spaced

% plot of mesh
% figure
% hold on
% for i = 1:nx
%     for j = 1:ny
%         plot(x(i),y(j),'kx','LineWidth',2)
%         fprintf("x(%i) = %g, y(%i) = %g \n",i,x(i),j,y(j)) % print coordinates
%     end
% end
% hold off

% more professional handling of the grid
figure
[X,Y] = meshgrid(x,y);
% function (zeros in this case) for a grid defined by X and Y
surf(X,Y,zeros(size(X))) % create surface plot
view(2) % 2d version of surf (x,y) plane

% [X(:) Y(:)] gives you the x and y coordinate of every node

K = zeros(nx*ny,nx*ny); 
rhs = zeros(nx*ny,1);

% goal: compute kx, ky, kc
dx = Lx/(nx-1);
dy = Ly/(ny-1);

kx = 1/dx^2;
ky = 1/dy^2;
kc = -2*(kx + ky);

for j = 1:ny
    for i = 1:nx

        k = (j-1)*nx + i; % linear index
        % disp(k)

        if (i==1 || i == nx || j==1 || j==ny) % we are on the border (dirichlet node)
            K(k,k) = 1; % set element on main diagonal equal to 1
            rhs(k) = 0;
        else % we are within the domain (internal nodes)
            K(k,k) = kc;
            K(k,k+1) = kx;
            K(k,k-1) = kx;
            K(k,k+nx) = ky;
            K(k,k-nx) = ky;

            rhs(k) = t;
        end
    end
end

phi = K\rhs; % linear solved up to machine precision

% surface plot
surf(x,y,reshape(phi,[nx ny]).'); % .' is transpose operator
% shading interp
xlabel('x')
ylabel('y')
zlabel('phi(x,y)')
colorbar

% contour plot
figure
contour(x,y,reshape(phi,[nx ny]).','LineWidth',2)
xlabel('x')
ylabel('y')
colorbar

% surf superimposed to contour with hold on/off
figure
surf(x,y,reshape(phi,[nx ny]).','FaceAlpha',0.5)
shading interp
xlabel('x')
ylabel('y')
zlabel('phi(x,y)')
colorbar
view(2)
hold on
contour(x,y,1*reshape(phi,[nx ny]).','k')
hold off

