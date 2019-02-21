
function plotDeCasteljau(P)
    prec = 10;
    X = zeros(prec,prec);
    Y = zeros(prec,prec);
    Z = zeros(prec,prec);
    u0 = linspace(0, 1, prec);
    v0 = linspace(0, 1, prec);
    for i = 1:prec
        for j = 1:prec
            s = deCasteljau2(P, 4, u0(i), v0(j));
            X(i,j) = s(1);
            Y(i,j) = s(2);
            Z(i,j) = s(3);
        end
    end
    surf(X, Y, Z, 'FaceAlpha', .8); axis equal;hold on;
end