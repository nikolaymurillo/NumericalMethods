% Cleaning commands
clc
clear
% =====================================
clc
clear
format short
% =====================================
% Inputs
fx = input('Input function f(x): ', 's');
x0 = input('Enter initial value: ');
es = input('Enter percentage error: '); 
itermax = input('Enter # of maximum iterations: ');
gx = input('Enter function g(x): ', 's');
g = inline(gx);
% =====================================
xr = x0;
iteraciones = 0;
g = inline(gx);
do = 0;
ea = 0;
% -------------------------------------------------------
fprintf('-------------------------------------------------------------------------------\n' )
fprintf('    SIMPLE ITERATION AROUND A POINT \n' )
fprintf('         n            x_i           Ea             Et\n' )
while (do == 0)
    
    xrold = xr;
    xr = g(xrold); 
    iteraciones = iteraciones + 1;
    
    if (xr ~= 0)
        ea = abs((xr - xrold)/xr)*100;
        et = (abs(xr - xr ))/ abs(xr)*100;
        tabla = [iteraciones, xr, ea,et];
        disp(tabla)
    end
    
    if ((ea < es) || (iteraciones >= itermax))
        break
    end
    % =====================================
    eax_plot = [ea];
    ny_iteraciones = [iteraciones];
    plot(ny_iteraciones,eax_plot,'r-o','LineWidth',1.5)
    hold on
    grid on
    title ('Iterations vs Approximate error');
    xlabel('# iterations')
    ylabel('Approximate error')
    % =====================================
end
% =====================================
fprintf(['-----------------------------------------------------------------------------\n'])
fprintf('The real value is x = %4.5f\n ', xr)
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
% If you want to test this script, please with this data:
% Input function f(x): exp(-x)-x
% Enter initial value: 0
% Enter percentage error: 0.01
% Enter # of maximum iterations: 10
% Enter function g(x): exp(-x)
