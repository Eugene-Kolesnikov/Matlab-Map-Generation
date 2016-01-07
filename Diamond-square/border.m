function r = border(I,H,s,i,t)
    if t == 'l'
        j = i - 1;
    elseif t == 't'
        j = i - s;
    end
    if j > 0
        x0 = I(j,1); y0 = I(j,2);
        xt = x0 + I(j,5); yt = y0 + I(j,6);
        r = H(xt,yt);
    else
        r = 0;
    end
end