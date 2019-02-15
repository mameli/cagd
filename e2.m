clear;
a = 0; b = 1; n = 3;
precision = 0.0001;
u = a:precision:b;
%
syms t;
x = 1.+t+t^2;
y = t^3;
x_1 = diff(x);
y_1 = diff(y);
x_2 = diff(x_1);
y_2 = diff(y_1);
%
control_point = zeros(2, n+1);
t = 0;
control_point(1, 1) = subs(x);
control_point(2, 1) = subs(y);
%calc v1 using first derivative
control_point(1, 2) = (subs(x_1) / 3) + control_point(1,1);
control_point(2, 2) = (subs(y_1) / 3) + control_point(2,1);
t = 1;
control_point(1, end) = subs(x);
control_point(2, end) = subs(y);
%calc v2 using second derivative
control_point(1, 3) = (control_point(1,2) + control_point(1,end) - (subs(x_2)/6))/2;
control_point(2, 3) = (control_point(2,2) + control_point(2,end) - (subs(y_2)/6))/2;
p_x = zeros(1, length(u));
p_y = zeros(1, length(u));

for i = 1:length(u)
    [t_x, t_y] = de_casteljau(n, control_point(1, :), control_point(2, :), u(i));
    p_x(i) = t_x(n+1, n+1); 
    p_y(i) = t_y(n+1, n+1);
end
fplot(x,y,[0 1]); hold on;
plot(control_point(1, :), control_point(2, :), '-o');
plot(p_x, p_y, 'linewidth',3); hold on;


%

for mu = 1:3 %for more points
    xm_p = zeros(1, n+mu+1);
    ym_p = zeros(1, n+mu+1);
    for i = 0:n+mu
        for j = i-mu:i     
            if and(j>=0, j<n+1)
                temp = nchoosek(n, j)*nchoosek(mu, i-j)/nchoosek(n+mu, i);
                xm_p(i+1) = xm_p(i+1) + temp*control_point(1,j+1);
                ym_p(i+1) = ym_p(i+1) + temp*control_point(2,j+1);
            end
        end
    end
    for i = 1:length(u)
        [t_x, t_y] = de_casteljau(n+mu, xm_p, ym_p, u(i));
        p_x(i) = t_x(n+1+mu, n+1+mu); 
        p_y(i) = t_y(n+1+mu, n+1+mu);
    end
    plot(xm_p, ym_p, '-o'); hold on;
    plot(p_x, p_y, 'linewidth',2.5); hold on;
end

%

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