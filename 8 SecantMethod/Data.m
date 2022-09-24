% RAPSHON
n = [1:10];
a = [100 11.70 0.1467 0 0 0 0 0 0 0 ];
b = [100 63.21 8.66  0.58 0.0048 0 0 0 0 0 ];
plot(n,a, '-o', 'LineWidth',2,'Color','g')
hold on
plot(n,b, '-o', 'LineWidth',2,'Color','c')
xlim([0 10])
ylim([-25  100])
title ('Newton Raphson vs Secant');
legend('Newton Rapshon','ISecant')
xlabel('Number of iterations')
ylabel('Error (Ea)')



