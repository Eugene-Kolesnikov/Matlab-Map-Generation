function [I1,S] = recalculate(I,s)
% for all squares in I: update the global array of squares
    [N,M] = size(I);
    I1 = zeros(4*N,M);

    k = s;
    S = 2 * s;

    for i = 1:N
        I1(floor((i-1)/k)*S+(2*i-1),:) = [I(i,1), I(i,2), I(i,1) + I(i,5), I(i,2) + I(i,6), 0, 0];
        I1(floor((i-1)/k)*S+(2*i),:) = [I(i,1) + I(i,5), I(i,2), I(i,3), I(i,2) + I(i,6), 0, 0];
        I1(floor((i-1)/k)*S+(2*i-1)+S,:) = [I(i,1), I(i,2) + I(i,6), I(i,1) + I(i,5), I(i,4), 0, 0];
        I1(floor((i-1)/k)*S+(2*i)+S,:) = [I(i,1) + I(i,5), I(i,2) + I(i,6), I(i,3), I(i,4), 0, 0];
    end

    if I(1,5) == 1
        I1 = [];
    end

end