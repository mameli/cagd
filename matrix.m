B_z = zeros(4, 4);

%  Corner
B_z(1, 1) = C_z(1, 1);
B_z(1, 4) = C_z(1, 4);
B_z(4, 1) = C_z(4, 1);
B_z(4, 4) = C_z(4, 4);

B_z(1, 2) = C_z(1, 1) + C_z(1, 2)/3;
B_z(2, 1) = C_z(1, 1) + C_z(2, 1)/3;
B_z(2, 2) = C_z(1, 1) + C_z(1, 2)/3 + C_z(2, 1)/3 + C_z(2, 2)/9;

B_z(3, 1) = C_z(4, 1) - C_z(3, 1)/3;
B_z(4, 2) = C_z(4, 1) + C_z(4, 2)/3;
B_z(3, 2) = C_z(4, 1) + C_z(4, 2)/3 - C_z(3, 1)/3 + C_z(3, 2)/9;

B_z(2, 4) = C_z(1, 4) + C_z(2, 4)/3;
B_z(1, 3) = C_z(1, 4) - C_z(1, 3)/3;
B_z(2, 3) = C_z(1, 4) + C_z(2, 4)/3 - C_z(1, 3)/3 - C_z(2, 3)/9;

B_z(3, 4) = C_z(4, 4) - C_z(3, 4)/3;
B_z(4, 3) = C_z(4, 4) - C_z(4, 3)/3;
B_z(3, 3) = C_z(4, 4) - C_z(4, 3)/3 - C_z(3, 4)/3 + C_z(3, 3)/9;

n = 2; m = 2;
indexes_i = linspace(1, n, n);
indexes_j = linspace(1, m, m);

prec = 15;
u = linspace(0, 1, prec);
v = linspace(0, 1, prec);

u_i = linspace(0, 1, n + 1);
v_j = linspace(0, 1, m + 1);
du_i = zeros(1, n);
dv_j = zeros(1, m);

for k = indexes_i
    du_i(k) = u_i(k + 1) - u_i(k);
end

for k = indexes_j
    dv_j(k) = v_j(k + 1) - v_j(k);
end

X_norms = [];
Y_norms = [];
Z_norms = [];

for i = indexes_i
    for j = indexes_j
        C = full_hermite_matrix_spine(f_x, f_y, f_z, u_i(i), u_i(i + 1), v_j(j), v_j(j + 1), du_i(i), dv_j(j));
        
        X_st = symfun((H_s.') * C(:,:,1) * H_t, [s,t]);
        Y_st = symfun((H_s.') * C(:,:,2) * H_t, [s,t]);
        Z_st = symfun((H_s.') * C(:,:,3) * H_t, [s,t]);

        for k = 1:prec
            for w = 1:prec
                X_hermite(k,w) = X_st(u(k), v(w));
                Y_hermite(k,w) = Y_st(u(k), v(w));
                Z_hermite(k,w) = Z_st(u(k), v(w));
            end
        end
        
        surf(X_hermite,Y_hermite,Z_hermite); axis equal;hold on;

        [uu, vv] = meshgrid(u, v);
        X = (2 + cos(vv)).*cos(uu);
        Y = (2 + cos(vv)).*sin(uu);
        Z = sin(vv);
        
        X_norms(end + 1) = norm(abs(X_hermite - X));
        Y_norms(end + 1) = norm(abs(Y_hermite - Y));
        Z_norms(end + 1) = norm(abs(Z_hermite - Z));
    end
end

mean(X_norms)
mean(Y_norms)
mean(Z_norms)