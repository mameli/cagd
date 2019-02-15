% piu' aumenta l piu' la curva tende al vertice 3
clear;
a = 0; b = 2; n = 3;
precision = 0.0001;
u = a:precision:b;
r_u = (u-a)./(b-a);
[x_p, y_p] = ginput(n+1);
p_x = zeros(1, length(u));
p_y = zeros(1, length(u));
for l = 0:5
    x_p2 = zeros(1, n+1+l);
    y_p2 = zeros(1, n+1+l);
    x_p2(1:3) = x_p(1:3);
    y_p2(1:3) = y_p(1:3);
    x_p2(3:end-1) = x_p(3);
    y_p2(3:end-1) = y_p(3);
    x_p2(end) = x_p(end);
    y_p2(end) = y_p(end);
    for i = 1:length(u)
        [t_x, t_y] = de_casteljau(n+l, x_p2, y_p2, r_u(i));
        p_x(i) = t_x(n+1+l, n+1+l); 
        p_y(i) = t_y(n+1+l, n+1+l);
    end
    plot(x_p2, y_p2, '-bd'); hold on;
    plot(p_x, p_y, 'linewidth',2.5); hold on;
end

function [Q_x,Q_y] = de_casteljau(n, x_p, y_p, u)
    Q_x = zeros(n+1, n+1);
    Q_y = zeros(n+1, n+1);
    Q_x(:,1) = x_p;
    Q_y(:,1) = y_p;
    for i = 2:n+1
        for j = i:n+1
            Q_x(j,i) = (1-u)*Q_x(j-1, i-1)+u*Q_x(j, i-1);
            Q_y(j,i) = (1-u)*Q_y(j-1, i-1)+u*Q_y(j, i-1);
        end
    end
end