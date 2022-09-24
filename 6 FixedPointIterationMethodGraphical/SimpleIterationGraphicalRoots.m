% Cleaning commands
clc
clear
format short
% =====================================
% Inputs
fx = input('Enter function f(x): ', 's');
x0 = input('Enter the initial value: ');
es = input('Enter the percentage error: '); % error deseado
itermax = input('Enter # of maximum iterations: ');
gx = input('Enter function g(x): ', 's');
g = inline(gx);
% =====================================
fplot(fx,'g','LineWidth',2)
hold on
% =====================================
xr = x0;
iteraciones = 0;
g = inline(gx);
do = 0;
% =====================================
fprintf('-------------------------------------------------------------------------------\n' )
fprintf('   SIMPLE ITERATION AROUND A POINT\n' )
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
    x = [xr];
    y = [0];
    plot(x,y,'b-o','LineWidth',1.5)
    hold on
    legend('Function', 'Approximate error')
    grid on
    title ('Simple iteration around a point for f(x)');
    xlabel('x')
    ylabel('f(x)')
    legend('Original functionf(x)', 'ApproximateRoot')
end
% =====================================
yline(0,'k','LineWidth',1.5)
fprintf(['-----------------------------------------------------------------------------\n'])
fprintf('The real value is x = %4.5f\n ', xr)
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
hold on
fplot(gx,'m','LineWidth',2)
%*--------------------------------------
% If you want to try this script test with this data
% Enter function f(x): exp(-x)-x
% Enter the initial value: 0
% Enter the percentage error: 0.01
% Enter # of maximum iterations: 10
% Enter function g(x): exp(-x)