clear;
a = 0;
b = 10;
t = a : 0.01 : b;

x = t;
y = cos(t);
plot(x, y, 'linewidth', 2);
hold on;

n = 50; % grado

% n + 1 vertici di controllo per approssimare la funzione
x_p = x(round(linspace(1, length(x), n + 1)));
y_p = y(round(linspace(1, length(y), n + 1)));

x_bez = zeros(1, length(x));
y_bez = zeros(1, length(y));

% intevallo [0, 1] per bernstein
u = linspace(0, 1, length(t));

for i = 1:n
    x_bez = x_bez + (bernstein(n, i, u) .* x_p(i + 1));
    y_bez = y_bez + (bernstein(n, i, u) .* y_p(i + 1));
end

% plot dei vertici usati
plot(x_p, y_p, 'X');
hold on;

% plot della curva di bezier
plot(x_bez, y_bez, 'linewidth', 1);

function y = bernstein(n, i, u)
    y = nchoosek(n, i).*u.^i.*(1 - u).^(n-i);
end



