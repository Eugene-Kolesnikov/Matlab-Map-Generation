function H = smooth_map(H) % smooth the height map 
    [n,m] = size(H);
    for i = 1:n
        for j= 1:m
            if i < 5 || i > n-5 || j < 5 || j > m-5
                alpha = 1;
            elseif i > floor((n-1)/2)-2 && i < floor((n-1)/2)+5
                alpha = 1.25;
            else
                alpha = 1.25;
            end
            H(i,j) = ( elem(H,i-1,j-1) + elem(H,i,j-1) + elem(H,i+1,j-1) + ...
                       elem(H,i,j-1)   + elem(H,i,j)   + elem(H,i,j+1) + ...
                       elem(H,i+1,j-1) + elem(H,i+1,j) + elem(H,i+1,j+1) ) / 9 * alpha;
        end
    end
end