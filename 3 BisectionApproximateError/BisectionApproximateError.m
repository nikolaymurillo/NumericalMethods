% Cleaning commands 
clc
clear
% =====================================
% Inputs
a = input('Enter a: ');
b = input('Enter b: '); % xu 
fun = input('Enter function: ', 's');
error = input('Enter error: ');
% =====================================
f = inline(fun);  % read the variable
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
fprintf('              BISECCTION METHOD\n')
fprintf('                       SOLUTION \n')
fprintf('Error = %8.5f\n', error)
fprintf('# Iterations = %8.5f\n', n)
fprintf('Approximate roots = %8.5f\n', raiz)
fprintf('Time of processing = %8.5f\n', tiempo)
fprintf('-------------------------------------------------------\n')
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
% If you want to test this script, please enter this data:
% Enter a: 0
% Enter b: 4
% Enter function:  x^10 -1
% Enter error: 0.01