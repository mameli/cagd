function [X,Y,Z] = plotDeCasteljau(P, precision)
    X = zeros(precision,precision);
    Y = zeros(precision,precision);
    Z = zeros(precision,precision);
    u0 = linspace(0, 1, precision);
    v0 = linspace(0, 1, precision);
    for i = 1:precision
        for j = 1:precision
            s = deCasteljau2(P, 4, u0(i), v0(j));
            X(i,j) = s(1);
            Y(i,j) = s(2);
            Z(i,j) = s(3);
        end
    end
%     surf(X, Y, Z, 'FaceAlpha', .8); axis equal;hold on;
end