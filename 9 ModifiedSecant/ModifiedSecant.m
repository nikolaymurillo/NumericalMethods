% Cleaning commands
clc
clear
% =====================================
n = 100;
err = 0.01;
% =====================================
f = @(x) exp(-x)-x;
x1 = 1;
delta = 0.01;
xx(1) = x1;
% =====================================
for i = 2:n 
    x2 = x1 - (f(x1)*delta*x1)/(f(x1+delta*x1) - f(x1));
    x1 = x2;
    xx(i) = x2;
    ii = i; 
    Err = abs(xx(i) - xx(i-1));
    if Err < err
        break 
    end 
end
% =====================================
fprintf('----------------------------------\n'); 
fprintf('      SECANT MODIFIED METHOD\n'); 
fprintf('The root is: %1.4f\n', x2); 
fprintf('Numbers of iterations: %1.4f\n', ii); 
fprintf('Code by Nikolay Murillo, July,2022\n'); 
fprintf('----------------------------------'); 
