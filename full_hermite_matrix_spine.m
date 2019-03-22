function [C] = full_hermite_matrix_spine(f_x, f_y, f_z, s_a, s_b, t_a, t_b, du, dv)
    C = zeros(4,4,3);

    C(:,:,1) = hermite_matrix_spine(f_x, s_a, s_b, t_a, t_b, du, dv);
    C(:,:,2) = hermite_matrix_spine(f_y, s_a, s_b, t_a, t_b, du, dv);
    C(:,:,3) = hermite_matrix_spine(f_z, s_a, s_b, t_a, t_b, du, dv);
end