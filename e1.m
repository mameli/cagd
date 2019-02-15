clear;
a = 0; b = 2; n = 4;
precision = 0.0001;
u = a:precision:b;
r_u = (u-a)./(b-a);
[x_p, y_p] = ginput(n+1);
p_x = zeros(1, length(u));
p_y = zeros(1, length(u));
for i = 1:length(u)
    [t_x, t_y] = de_casteljau(n, x_p, y_p, r_u(i));
    p_x(i) = t_x(n+1, n+1); 
    p_y(i) = t_y(n+1, n+1);
end
% 
% 
plot(x_p, y_p, '-O'); hold on;
plot(p_x, p_y, 'linewidth',3); hold on;

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