clear;
a = 0; b = 1; n = 3;
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

plot(x_p, y_p, '-bd'); hold on;
plot(p_x, p_y, 'linewidth',2.5); hold on;

for mu = 1:5
    xm_p = zeros(1, n+mu+1);
    ym_p = zeros(1, n+mu+1);
    for i = 0:n+mu
        for j = i-mu:i     
            if and(j>=0, j<n+1)
                temp = nchoosek(n, j)*nchoosek(mu, i-j)/nchoosek(n+mu, i);
                xm_p(i+1) = xm_p(i+1) + temp*x_p(j+1);
                ym_p(i+1) = ym_p(i+1) + temp*y_p(j+1);
            end
        end
    end
    for i = 1:length(u)
        [t_x, t_y] = de_casteljau(n+mu, xm_p, ym_p, r_u(i));
        p_x(i) = t_x(n+1+mu, n+1+mu); 
        p_y(i) = t_y(n+1+mu, n+1+mu);
    end
    plot(xm_p, ym_p, '-o'); hold on;
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