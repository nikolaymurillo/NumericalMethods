% Cleaning commands
clc
clear
% =====================================
% Working with a symbolic variable
syms x  
% =====================================
fprintf('      REGLA DEL TRAPECIO    \n\n');
f = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
g = inline(f);
% =====================================
derivada = diff(f,x);
derivada_segunda = diff(derivada,x);
d = inline(derivada);
% =====================================
% True value of the integral
I_verdadero = 1.6416;
fprintf('The true value of the integral analytically is: 1.6416\n');
% =====================================
% Calculate the h
h = (b-a);
% =====================================
% Implementation of the numerical method
I = (h/2)*(g(a)+g(b));
fprintf('Value of the integral with trapezoid method is: %4.4f\n',I);
% =====================================
% Approximate error
error_aprox = -1/12*(-48/(b-a))*h^3;
fprintf('Approximate error is %4.4f\n',error_aprox);
% =====================================
% True error
error_verdadero = abs((I_verdadero -I)/I_verdadero)*100;
fprintf('True error is %4.4f\n',error_verdadero);
fprintf('Code by Nikolay Murillo,2022.')
% =====================================
% If you want to test this script, please with this data:
% Enter the function: 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
% Enter lower limit: 0
% Enter upper limit: 1



