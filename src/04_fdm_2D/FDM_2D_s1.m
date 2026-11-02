function [phi,X,Y] = FDM_2D_s1(geom,t)
    % Remember to explain your functions for others, but mainly for yourself in the future!
    %   geom: ...
    %   t: ...
    %   phi = ...
    %   X,Y = ...
    %   example of usage: ...
    %
    % Lines marked with TODO are to be completed. As it is, the function
    % runs and returns placeholder outputs (phi = 0 everywhere).

    % extract the info you need from geom
    nx = geom.nx; % number of nodes along x
    ny = geom.ny; % number of nodes along y
    % TODO: Lx, Ly, dx, dy

    % use meshgrid to create the X and Y matrices
    X = []; Y = []; % TODO: [X,Y] = meshgrid(...)

    % preallocate [K] and {rhs} for speed using the zeros function
    % TODO: K = ...
    % TODO: rhs = ...

    % pre-define the coefficients of the [K] matrix (see the slides)
    kx = 0; % TODO: horizontal coefficient
    ky = 0; % TODO: vertical coefficient
    kc = 0; % TODO: central coefficient

    % loop for [K] and {rhs} assembly
    for j = 1:ny % number of nodes along the y-direction
        for i = 1:nx % number of nodes along the x-direction
            % linear node index (row by row)
            k = (j-1)*nx + i;

            if i==1 || i==nx || j==1 || j==ny % boundary nodes
                % TODO: K(k,k) = ...
                % TODO: rhs(k) = 0; % boundary condition
            else
                % internal nodes: five-point stencil
                % TODO: K(k,k) = ...
                % TODO: K(k,k+1) = ...
                % TODO: K(k,k-1) = ...
                % TODO: K(k,k+nx) = ...
                % TODO: K(k,k-nx) = ...

                % TODO: rhs(k) = ...
            end
        end
    end

    % solve the linear system using \ (backslash)
    phi = zeros(ny,nx); % TODO: phi = ...

    % the obtained phi array has to be "reshaped" to get an ny x nx matrix,
    % like X and Y: look up the "reshape" function in the MATLAB documentation

end
