% Cleaning commands 
clc
clear
% =====================================
% Format
% =====================================
% Inputs
x0 = input('Enter initial value: ');
es = input('Enter the percentage error: '); % error 
itermax = input('Enter # of maximum iterations: ');
gx = input('Enter the function: ', 's');
g = inline(gx);
% =====================================
xr = x0;
iteraciones = 0;
g = inline(gx);
do = 0;
% =====================================
fprintf('-------------------------------------------------------------------------------\n' )
fprintf('         SIMPLE ITERATION AROUND A POINT\n' )
fprintf('-------------------------------------------------------------------------------\n' )
fprintf('         n            x_i           Ea             Et\n' )
% =====================================
while (do == 0)
    xrold = xr;
    xr = g(xrold); 
    iteraciones = iteraciones + 1;
    % =====================================
    % Compute the absolute error
    if (xr ~= 0)
        ea = abs((xr - xrold)/xr)*100; % Approximate percentage error
        et = (abs(0.56716 - xr ))/ abs(0.56716)*100;
        tabla = [iteraciones, xr, ea,et];
        disp(tabla)
    end
    % Compute the absolute error
    if ((ea < es) || (iteraciones >= itermax))
        break
    end
end
% =====================================
fprintf(['-----------------------------------------------------------------------------\n'])
fprintf('The real value x = %4.5f\n ', xr)
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
% If you want to test this script, please with this data:
% Enter initial value: 0
% Enter the percentage error: 0.01
% Enter # of maximum iterations: 4
% Enter the function: exp(x) - x
