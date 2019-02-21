
function [C_ij] = hermite_matrix(f_x, s_a, s_b, t_a, t_b, du, dv)
    syms t s
    C_ij = zeros(4, 4);
    
    df_xt = diff(f_x, t);
    df_xs = diff(f_x, s);
    df_xst = diff(f_x, s, t);
    
    C_ij(1,1) = f_x(s_a, t_a);
    C_ij(1,2) = dv*df_xt(s_a, t_a);
    C_ij(2,1) = du*df_xs(s_a, t_a);
    C_ij(2,2) = du*dv*df_xst(s_a, t_a);

    C_ij(1,4) = f_x(s_a, t_b);
    C_ij(1,3) = dv*df_xt(s_a, t_b);
    C_ij(2,4) = du*df_xs(s_a, t_b);
    C_ij(2,3) = du*dv*df_xst(s_a, t_b);

    C_ij(4,1) = f_x(s_b, t_a);
    C_ij(4,2) = dv*df_xt(s_b, t_a);
    C_ij(3,1) = du*df_xs(s_b, t_a);
    C_ij(3,2) = du*dv*df_xst(s_b, t_a);

    C_ij(4,4) = f_x(s_b, t_b);
    C_ij(4,3) = dv*df_xt(s_b, t_b);
    C_ij(3,4) = du*df_xs(s_b, t_b);
    C_ij(3,3) = du*dv*df_xst(s_b, t_b);
end