% Cleaning commands
clc
clear
% =====================================
% Format
format short
% =====================================
% Inputs
x0 = input('Enter the initial value: ');
es = input('Enter the percentage error: ');
itermax = input('Enter # of maximum iterations: ');
fx = input('Enter function f(x): ', 's');
gx = input('Enter function g(x): ', 's');
g = inline(gx);
% =====================================
fplot(fx)
hold on
% =====================================
xr = x0;
iteraciones = 0;
g = inline(gx);
do = 0;
% =====================================
fprintf('-------------------------------------------------------------------------------\n' )
fprintf('      SIMPLE ITERATION AROUND A POINT\n' )
fprintf('-------------------------------------------------------------------------------\n' )
fprintf('         n            x_i           Ea             Et\n' )
while (do == 0)
    xrold = xr;
    xr = g(xrold); 
    iteraciones = iteraciones + 1;

    if (xr ~= 0)
        ea = abs((xr - xrold)/xr)*100; 
        et = (abs(2.99918 - xr ))/ abs(2.99918)*100;
        tabla = [iteraciones, xr, ea,et];
        disp(tabla)
    end

    if ((ea < es) || (iteraciones >= itermax))
        break
    end
    x = [xr];
    y = [0];
    plot(x,y,'r-o','LineWidth',2)
    hold on
    legend('Function', 'Approximate root')
    grid on
    title ('Simple iteration around a point f(x)');
    xlabel('x')
    ylabel('f(x)')
    legend('Original Functions f(x)', ' Iterations')
end
% =====================================
fprintf(['-----------------------------------------------------------------------------\n'])
fprintf('El valor real es x = %4.5f\n ', xr)
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
hold on
fplot(gx)
% =====================================
% If you want to try this script test with this data
% Enter the initial value: 0
% Enter the percentage error: 0.01
% Enter # of maximum iterations: 10
% Enter function f(x): exp(-x)-x
% Enter function g(x): exp(-x)