function [c] = deCasteljau(P, n, u)
    Q = P;
    for k = 2:n + 1
        for i = 1:n - k + 1
            Q(:,i,:) = (1-u) * Q(:,i,:) + u*Q(:,i+1,:);
        end
    end
    c = [Q(1,1,1), Q(1,1,2), Q(1,1,3)]';
end