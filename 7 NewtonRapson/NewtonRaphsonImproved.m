% Cleaning commands
clc
clear
% =====================================
% Format
format long
% =====================================
% Working with symbolic variable
syms x
% =====================================
% Inputs
fun = input('Enter function f(x): ');
x0 = input('Ingrese el valor inicial: ');
n_iteraciones = input('Ingrese el número máximo de iteraciones: ');
% =====================================
% Plot the inital function
fplot(fun,'g','LineWidth',2)
hold on
% =====================================
% Read the function (inline)
g = inline(fun); 
derivada =  diff(fun);
d = inline(derivada); 
% =====================================
e0 = 0.01;
ea = 0.01;
fprintf('-----------------------------------------------------------------------------------------------------\n' )
fprintf('                       NEWTON RAPHSON METHOD\n' )
fprintf('n \t\t Approximate Root \t\t Et \t\t Ea\n');
% =====================================
i = 0;
j = 0;
raiz_aprox = 1;
% =====================================
if x0 == roots(derivada)
    fprintf('Change point x0\n')
end
for i = 0:n_iteraciones - 1
    a = x0;
    x0 = x0 - (g(x0)/d(x0));
    ea = abs((x0 - a)/x0);exp(-x0);
    et = abs((raiz_aprox-x0)/raiz_aprox);
    i = i+1;
    x_plot = [x0];
    y_plot = [0];
    plot(x_plot,y_plot,'r-o','LineWidth',1.5)
    %-----------------------------------------------------------
    % Inflection point
    derivada_2 = diff(fun,2);
    if derivada_2 == 0
        fprintf(' Punto de inflexión\n')
        break
    end
    fprintf('%d \t\t\t %1.4f \t\t %1.3f \t\t %1.4f\n',i,x0,et*100,ea*100);
end
hold on
legend('Función', 'raiz aproximada')
grid on
title ('Método de Newton Raphson para f(x)');
xlabel('x')
ylabel('f(x)')
hold on
yline(0,'b','LineWidth',1.5)
legend('Función original f(x)','IRaizAproximada')
% =====================================
fprintf('-----------------------------------------------------------------------------------------------------\n' )
fprintf('El valor real es x = %4.5f\n ', x0)
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
% If you want to try this script, please with this data:
% Enter function f(x): exp(-x)-x
% Ingrese el valor inicial: 0
% Ingrese el número máximo de iteraciones: 10
