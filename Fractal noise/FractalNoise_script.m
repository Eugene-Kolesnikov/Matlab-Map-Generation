rng(8); % set seed

persistence = 0.6;
octaves = 7;

xlim = 10;
ylim = 10;
    
[Xq,Yq] = meshgrid(1:1/(2^(octaves-1)):xlim,1:1/(2^(octaves-1)):ylim);
H = zeros(size(Xq));

for i = 1:octaves
	freq = 2^(i-1);
	ampl = 5*persistence^(i-1);
    [X,Y] = meshgrid(1:1/freq:xlim,1:1/freq:ylim);
    H = H + interp2(X,Y,ampl*rand(size(X)),Xq,Yq,'cubic');
end

minHeight = min(min(H));
H = H - minHeight;

% heuristic
heuristicHeight = 0.71 * max(max(H));
H = 1.7 * H + 0.1 * H .* (H > heuristicHeight) - sin(H);
H = smooth_map(smooth_map(H));

% setting water level
maxHeight = max(max(H));
waterLevel = 0.45*maxHeight; % 45% of heights
H = H - waterLevel;

%% plotting the height map
h.fig = figure(1); hold on;
h.surf = handle(surf(H));
zlimit = zlim; zmin = zlimit(1);
set(h.surf, 'ZData', [NaN, zmin+zeros(1,size(H,2)), NaN ;...
                      zmin+zeros(size(H,1),1), H, zmin+zeros(size(H,1),1);...
                      NaN, zmin+zeros(1,size(H,2)), NaN]);
axis square; axis equal; axis off; view(80,30);
demcmap(H);shading interp; shadem([50 25],'sun');