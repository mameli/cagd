clear;
a = 0;
b = 1;
n = 5;

u = linspace(a,b, 1000);

x_bez = zeros(1, length(u));
y_bez = zeros(1, length(u));

x_p = [0, 2, 3, 5, 5.5, 7];
y_p = [0, 2, 1, 3, 0.5, 1];

for i = 1:n
    x_bez = x_bez + (bernstein(n, i, u) .* x_p(i+1));
    y_bez = y_bez + (bernstein(n, i, u) .* y_p(i+1));
end

% punti
plot(x_p, y_p, '-O');
hold on;

% curva
plot(x_bez, y_bez, 'linewidth',2);

function y = bernstein(n, i, u)
    y = nchoosek(n,i).*u.^(i).*((1-u).^(n-i));
end