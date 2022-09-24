% Cleaning commands
clc
clear
% =====================================
% Format 
format long
% =====================================
% Working with symbolic variable
syms x
fun = input('Enter function f(x): ');
x0 = input('Enter a initial value: ');
n_iteraciones = input('Enter # of maximum iterations: ');
% =====================================
% Plot the initial function
fplot(fun,'g','LineWidth',2)
hold on
% =====================================
% Read the funcion input
g = inline(fun); 
derivada =  diff(fun);
d=inline(derivada); 
% =====================================
% For the erros 
e0 = 0.01;
ea = 0.01;
fprintf('-----------------------------------------------------------------------------------------------------\n' )
fprintf('                       NEWTON RAPHSON METHOD \n' )
fprintf('n \t\t Approximate Root \t\t Et \t\t Ea\n');
% =====================================
i = 0;
j = 0;
raiz_aprox = 1;
% =====================================
for i = 0:n_iteraciones - 1
    a = x0;
    x0 = x0 - (g(x0)/d(x0));
    ea = abs((x0 - a)/x0);exp(-x0);
    et = abs((raiz_aprox-x0)/raiz_aprox);
    i = i+1;
    x_plot = [x0];
    y_plot = [0];
    plot(x_plot,y_plot,'r-o','LineWidth',1.5)
    fprintf('%d \t\t\t %1.4f \t\t %1.3f \t\t %1.4f\n',i,x0,et*100,ea*100);
end
% =====================================
% Plot and legend
hold on
legend('Functions', 'Approximate Root')
grid on
title ('Newton Raphson Method for f(x)');
xlabel('x')
ylabel('f(x)')
hold on
yline(0,'b','LineWidth',1.5)
legend('Original function f(x)','IApproximateRoot')
% =====================================
fprintf('-----------------------------------------------------------------------------------------------------\n' )
fprintf('The real value is x = %4.5f\n ', x0)
fprintf('Codey by Nikolay Murillo, 2022.')
% =====================================
% If you want to try this script test with this data
% Enter function f(x): exp(-x)-x
% Enter a initial value: 0
% Enter # of maximum iterations: 10
% =====================================
% For visualize the plot please make zoom in the circles.
