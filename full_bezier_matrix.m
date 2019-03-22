function M = full_bezier_matrix(C_x, C_y, C_z)
    M = zeros(4, 4, 3);

    M(:,:, 1) = bezier_matrix(C_x);
    M(:,:, 2) = bezier_matrix(C_y);
    M(:,:, 3) = bezier_matrix(C_z);
end