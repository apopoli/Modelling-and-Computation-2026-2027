clc % clears output
clear variables % clear any variable stored in workspace

format long

%% section 1
clc

1 + 2 == 3 % ok

1.0 + 2.0 == 3.0 % ok
(1.0 + 2.0) - 3.0 % expect 0

0.1 + 0.2 == 0.3 % not ok, - yes it is right
(0.1 + 0.2) - 0.3

% another check....
1 + 1e-12
1 + 1e-17

%% section 2
clc

% associative property
a = (0.1 + 0.2) + 0.3;
b = 0.1 + (0.2 + 0.3);

a == b