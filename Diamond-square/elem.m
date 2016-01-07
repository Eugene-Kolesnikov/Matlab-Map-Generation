function r = elem(H,i,j)
    [n,m] = size(H);
    if i > 0 && j > 0 && i <= n && j <= m
        r = H(i,j);
    else
        r = 0;
    end
end