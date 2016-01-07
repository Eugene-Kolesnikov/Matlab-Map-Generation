function [I,H] = square_alg(I,H)
% for all squares in I: create middle point, interpolate value with rand
% and update I with mid point coords

[N,~] = size(I);

for i = 1:N
    % save coordinates
    x0 = I(i,1); y0 = I(i,2);
    x1 = I(i,3); y1 = I(i,4);
    % get max distance
    d = max(abs(y1-y0), abs(x1-x0));
    % compute middle point local coordinates
    tx = floor((x1-x0-1)/2) + 1;
    ty = floor((y1-y0-1)/2) + 1;
    % save local coordinates
    I(i,5) = tx; I(i,6) = ty;
    % compute height in middle point (using interpolation) with random
    H(x0+tx,y0+ty) = (H(x0,y0) + H(x0,y1) + H(x1,y0) + H(x1,y1)) / 4 + rnd(d);
end

end