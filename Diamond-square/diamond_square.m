% Diamond-Square algorithm for terrain generation
function H = diamond_square(I,H)
% Input: I - index array, H - height map
% Ouput: H - height map
    s = 1; % squares on level
    while max(size(I)) ~= 0
        [I,H] = square_alg(I,H); % for all squares
        H = diamond_alg(I,H,s); % for all squares
        [I,s] = recalculate(I,s); % reculculate squares
    end
end
