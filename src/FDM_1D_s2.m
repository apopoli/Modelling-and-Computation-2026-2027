function [x,phi] = FDM_1D_s2(geom,BC,t)
%FDM_1D_s1 Solves Poisson equation in 1D for uniform t and Dirichlet/Neumann BCs
%   Inputs: geom (structure, geometry), BC (structure, boundary
%   conditions), t (uniform forcing term) 
%   Outputs: x (nodes coordinates), phi (nodal values of unknown function)

dx = (geom.b-geom.a)/(geom.n-1); % spacing

K = zeros(geom.n);
rhs = zeros(geom.n,1);

% loop on internal nodes
for k = 2:geom.n-1
    K(k,k-1) = 1; % left node of stencil for row k
    K(k,k) = -2; % central node of stencil for row k
    K(k,k+1) = 1; % right node of stencil for row k

    rhs(k) = t*dx^2; % rhs
end
% Dirichlet BCs
K(1,1) = 1; 
rhs(1) = BC.a.val; % value of Dirichlet BC in a

if BC.b.type == 'D'
    K(geom.n,geom.n) = 1;
    rhs(geom.n) = BC.b.val; % value of Dirichlet BC in b
elseif  BC.b.type == 'N' % if BC.b.type is not dirichlet
    K(geom.n,geom.n-1) = 1;
    K(geom.n,geom.n) = -1;
    rhs(geom.n) = dx*(dx/2*t-BC.b.val); % value of Neumann BC in b
else
    error('Valid BC types are D and N')
end

% solve linear system
phi = K\rhs;

x = geom.a + dx*(0:geom.n-1); % node coordinates

end