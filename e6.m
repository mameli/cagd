a = 0; b = 1; n = 3;
precision = 0.0001;
u = a:precision:b;
r_u = (u-a)./(b-a);
x_p = [0 1 3 6];
y_p = [0 2 2 -1];
p_x = zeros(1, length(u));
p_y = zeros(1, length(u));
%second curve
x_p2 = zeros(1, length(x_p));
y_p2 = zeros(1, length(y_p));
x_p2(1) = x_p(end);
y_p2(1) = y_p(end);
h0 = sqrt((x_p(4)-x_p(3))^2+(y_p(4)-y_p(3))^2);
h1 = 2;

x_p2(2)=( x_p(4)-(h1/(h0+h1))*x_p(3) )*(h0+h1)/h0;
y_p2(2)=( y_p(4)-(h1/(h0+h1))*y_p(3) )*(h0+h1)/h0;

x_p2(3)=h1/h0*(x_p2(2)*(1+h0/h1)-(x_p(3)+h1/h0*(x_p(3)-x_p(2))));
y_p2(3)=h1/h0*(y_p2(2)*(1+h0/h1)-(y_p(3)+h1/h0*(y_p(3)-y_p(2))));
x_p2(4) = 8; % a caso
y_p2(4) = 8;

for i = 1:length(u)
    [t_x, t_y] = de_casteljau(n, x_p, y_p, r_u(i)); %original bezier curve
    p_x(i) = t_x(n+1, n+1); 
    p_y(i) = t_y(n+1, n+1);
end

plot(x_p, y_p, '-o'); hold on;
plot(p_x, p_y, 'b', 'linewidth', 2); hold on;

for i = 1:length(u)
    [t_x, t_y] = de_casteljau(n, x_p2, y_p2, r_u(i)); %original bezier curve
    p_x(i) = t_x(n+1, n+1); 
    p_y(i) = t_y(n+1, n+1);
end

plot(x_p2, y_p2, '-ro'); hold on;
plot(p_x, p_y, 'r', 'linewidth', 2); hold on;

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