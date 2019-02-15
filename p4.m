clear;
a = 0;
b = 5;
u = a : 0.01 : b;
% u deve essere tra [0, 1] quindi si normalizza
u = (u - a)./ (b - a);
n = 4;

for i = 0 : 1 : n
    plot(u, bernstein(n, i, u), 'linewidth', 2);
    hold on;     
end

function y = bernstein(n, i, u)
    y = nchoosek(n, i).*u.^i.*(1 - u).^(n-i);
end

