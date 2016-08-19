function [E,N] = cyclotron(V)
m = 3.344*10^(-27);                 % deuteron mass
q = 1.603*10^(-19);                 % deuteron charge
B = 1.600;                          % magnetic field strength
r = sqrt((m * V) ./ (q * (B^2)));   % radius of deuteron for r1 (i.e. N = 1)

%% N from 0 to 2
r0 = r ./ 2;                        % radius of deuteron for r0 (i.e. N = 0)
pos = - r0;                         % initial distance from center point (- to left, + to right) 
pos = pos + 2 * r;                  % distance from center point at N = 1 
N = 1;                              % number of passes after leaving first D
D = -2;                             % if negative, next deuteron is in bottom D
%% N from 2 to n
while pos >= - 0.5
    r = sqrt(( (r^2) + ((2 * m * V) ./ (q * B^2)) ));
    pos = pos + D * r;
    D = -D;                         % change of D
    N = N + 1;                      % increase of N
end
E = V * N * 10^(-6);
