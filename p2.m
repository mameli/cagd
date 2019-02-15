t = 0 : 0.01 : pi;

x = cos(3*t).*cos(t);
y = sin(t).*cos(3*t);
plot(x, y);
hold on;

plotParametricFunctionR2(x, y, t);

function plotParametricFunctionR2(x, y, t)
    for i = 1:10:length(t)
        plot(x(i), y(i), '*');
        hold on;
    end
end