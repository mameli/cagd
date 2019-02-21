
function M = bezier_matrix(C)
    M = zeros(4, 4);

    M(1, 1) = C(1, 1);
    M(1, 4) = C(1, 4);
    M(4, 1) = C(4, 1);
    M(4, 4) = C(4, 4);

    M(1, 2) = C(1, 1) + C(1, 2)/3;
    M(2, 1) = C(1, 1) + C(2, 1)/3;
    M(2, 2) = C(1, 1) + C(1, 2)/3 + C(2, 1)/3 + C(2, 2)/9;

    M(3, 1) = C(4, 1) - C(3, 1)/3;
    M(4, 2) = C(4, 1) + C(4, 2)/3;
    M(3, 2) = C(4, 1) + C(4, 2)/3 - C(3, 1)/3 + C(3, 2)/9;

    M(2, 4) = C(1, 4) + C(2, 4)/3;
    M(1, 3) = C(1, 4) - C(1, 3)/3;
    M(2, 3) = C(1, 4) + C(2, 4)/3 - C(1, 3)/3 - C(2, 3)/9;

    M(3, 4) = C(4, 4) - C(3, 4)/3;
    M(4, 3) = C(4, 4) - C(4, 3)/3;
    M(3, 3) = C(4, 4) - C(4, 3)/3 - C(3, 4)/3 + C(3, 3)/9;
end