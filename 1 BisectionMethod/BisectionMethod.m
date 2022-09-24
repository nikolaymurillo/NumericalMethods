% Cleaning commands
clc
clear
% =====================================
%Inputs
a = input('Enter a: ');
b = input('Enter b: '); % xu 
fun = input('Enter the function: ', 's');
error = input('Enter the error: ');
% =====================================
f = inline(fun);  
% e = 100;
n = 0; 
tic;
% =====================================
while error >= 0.01
    raiz = (a + b) / 2;
    error = (abs(b - a) / 2) * 100;
    if f(a) * f(raiz) < 0
        b = raiz;
    else 
        a = raiz;
    end 
    n = n + 1;
    tiempo = toc; 
end
% =====================================
fprintf('-------------------------------------------------------\n')
fprintf('               BISECTION METHOD \n')
fprintf('                     SOLUTION\n')
fprintf('Error = %8.5f\n', error)
fprintf('Iteration  = %8.5f\n', n)
fprintf('Approximate root = %8.5f\n', raiz)
fprintf('Time processing = %8.5f\n', tiempo)
fprintf('-------------------------------------------------------\n')
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
% If you want to test this script, please with this data:
% Enter a: 0
% Enter b: 4
% Enter the function: -0.5*x.^2 + 2.5*x + 4.5
% Enter the error: 0.01