clear; close all;
rng(5); % set seed
%% initialization
%waterlevel = -35; % for power = 9
waterlevel = -20; % for power = 8
power = 8; % 8 -- good detalization
L = 2 ^ (power+1) + 1; % axes lengths
H = zeros(L,L); % height map
% initialization of border heights
H(1,1) = 0; H(1,L) = 0;
H(L,1) = 0; H(L,L) = 0;
% initialization of index array
I = [ 1, 1, L, L, 0, 0 ];
%% applying transformations
H = diamond_square(I,H); % applying the diamond-square algorithm
% applying aftertransformations
H = H + abs(min(min(H))) + waterlevel; % setting water level
H = smooth_map(H);
%% plotting the height map
h.fig = figure(1); hold on;
h.surf = handle(surf(H)); 
zlimit = zlim; zmin = zlimit(1);
set(h.surf, 'ZData', [NaN, zmin+zeros(1,size(H,2)), NaN ;...
                      zmin+zeros(size(H,1),1), H, zmin+zeros(size(H,1),1);...
                      NaN, zmin+zeros(1,size(H,2)), NaN]);
axis square; axis equal; axis off; view(80,30);
demcmap([waterlevel max(max(H))]); shading interp; shadem([50 25],'sun');