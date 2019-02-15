x = 0 : 0.01 : 16;
y = 100.*x.^2;
z = 2.^x;
plot(x, y, 'linewidth', 18);
hold on;
plot(x,z, 'linewidth', 18);

% function plotFunction(x, y)
%     plot(x, y);
%     hold on;
%     for i = 1:5:length(x)
%         plot(x(i), y(i), 'x');
%         hold on;
%     end
% end
