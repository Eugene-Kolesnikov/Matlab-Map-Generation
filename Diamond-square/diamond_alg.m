function H = diamond_alg(I,H,s)
% for all squares in I: calculate coordinates for the points
% on the borders and their heights

[N,~] = size(I);

for i = 1:N
    % for all squares in I: calculate coordinates for the point on the left
    % border and on the top border, calculate their heights
    x0 = I(i,1); y0 = I(i,2);
    x1 = I(i,3); y1 = I(i,4);
    tx = I(i,5); ty = I(i,6);
    H(x0,y0+ty) = ( border(I,H,s,i,'l') + H(x0,y0) + H(x0+tx,y0+ty) + H(x0,y1) ) / 4 + rnd(max(tx,ty));
    H(x0+tx,y0) = ( H(x0,y0) + border(I,H,s,i,'t') + H(x1,y0) + H(x0+tx,y0+ty) ) / 4 + rnd(max(tx,ty));
    if mod(i,s) == 0
       % right border 
       H(x1,y0+ty) = ( H(x0+tx,y0+ty) + H(x1,y0) +  H(x1,y1) ) / 4 + rnd(max(tx,ty));
    end
    if i > (N-s)
        % bottom border
        H(x0+tx,y1) = ( H(x0,y1) + H(x0+tx,y0+ty) + H(x1,y1) ) / 4 + rnd(max(tx,ty));
    end
end

end