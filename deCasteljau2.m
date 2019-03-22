function [s] = deCasteljau2(P, n, u0, v0)
    Q = zeros(1, n, 3);
    for i = 1:n
        Q(:,i,:) = deCasteljau(P(i,:,:), n, v0);
    end
    s =  deCasteljau(Q, n, u0);
end