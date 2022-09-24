% Cleaning commands
clc
clear
% =====================================
% Working with a symbolic variable
syms x  
% =====================================
fprintf('-----------------------------------------\n' )
fprintf('               SIMPSON 1/3   \n ');
fprintf('-----------------------------------------\n' )
f = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
% =====================================
% Derivadas
de = diff(f,x);
de_4 = diff(de,x,3);
% =====================================
% Real value of the integral
I_v = 1.64053;
% =====================================
% Integral para el error
% Cuarta derivada
E = -1920;
h = (b-a); % Ancho
x_medio = (a+b)/2;
% =====================================
g = inline(f);
% =====================================
% Integral por Simpson
I = h/6*(g(a)+4*g(x_medio)+g(b));
% =====================================
% Errors
Ea = -1/2880*(E/(b-a))*h^5; % approximate error
Et = abs((I_v-I)/I_v)*100;    % real error
% =====================================
% Output
fprintf('-------------------------------------------\n');
fprintf('Value of the approximate integral: %4.3f\n', I);
fprintf('Eror Ea : %4.3f\n', Ea);
fprintf('Value Et: %4.3f\n', Et);
fprintf('-------------------------------------------\n')
fprintf('Code by Nikolay Murillo,2022.')
% =====================================
% If you want to test this script, please with this data:
% Enter the function: 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
% Enter lower limit: 0
% Enter upper limit: 1
