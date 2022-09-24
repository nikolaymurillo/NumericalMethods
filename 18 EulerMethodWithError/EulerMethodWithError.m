% Cleaning commands
clc
clear
% =====================================
% Format
format short
% =====================================
% Working with a symbolic variable
syms x
syms y
% =====================================
fprintf('\nSOLUTION OF DIFFERENTIAL EQUATIONS BY EULER METHOD\n')
% =====================================
% Condiciones iniciales
x1 = input('\nEnter the first point x0: ');
x2 = input('\nEnter the second point x1: ');
h = input('\nEnter the step: ');
yi = input('\nEnter the initial condition y(x0): ');
% =====================================
% x1 = 0;
% x2 = 4;
% h = 0.5;
x0 = 0;
% yi = 1;
% =====================================
% EDO
% dydx = input('\nIngrese la ecuacion diferencial de la forma dy/dx=f(x,y):   ','s');
dydx = -2*x.^3 + 12*x.^2 - 20*x  + 8.5;
f = - x^4/2 + 4*x^3 - 10*x^2 + (17*x)/2 + 1;
% =====================================
M = [];
y_euler = 1;
y_verdadero = 1;
y_basado_num_real = 1;
% =====================================
% Diferenciación
f1_prima_xi_yi = diff(dydx, x, 1);
f2_prima_xi_yi = diff(dydx, x, 2);
f3_prima_xi_yi = diff(dydx, x ,3);
% =====================================
while x1<= x2
    % =====================================
    Et_2 = double(subs(f1_prima_xi_yi,{x,y},{x1,x2})*h^2/factorial(2));
    Et_3 = double(subs(f2_prima_xi_yi,{x,y},{x1,x2})*h^3/factorial(3));
    Et_4 = double(subs(f3_prima_xi_yi,{x,y},{x1,x2})*h^4/factorial(4));
    Et = Et_2 + Et_3 + Et_4;
    % =====================================
    phi = double(subs(dydx,x,x1));
    Eglobal = double((y_verdadero-y_euler)/y_verdadero*100);
    Elocal = double((y_verdadero-y_basado_num_real)/y_verdadero)*100;
    M = [M;x1,phi,y_verdadero,y_euler,Eglobal,Elocal];
    y_basado_num_real = y_verdadero+phi*h;
    x1 = x1+h;
    y_euler = yi+phi*h;
    y_verdadero = double(subs(f,x,x1));
    yi = y_euler;
end
disp('        x        phi       y_true    y_Euler     Eglobal %      Elocal%')
M
fprintf('Code by Nikolay Murillo, July,2022.\n')
% =====================================
% If you want to try this script, please with this data:
% Enter the first point x0: 0
% Enter the second point x1: 4
% Enter the step: 1
% Enter the initial condition y(x0): 1
