% Cleaning commands
clc
clear
% =====================================
% Working with symbolic variables
syms x
% =====================================
% Format 
format short
% =====================================
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('                                                 SIMPSON RULE 3/8    \n');
fprintf('                                               UNIQUE APLICATION   \n');
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
% =====================================
% Inputs
f = input('Enter function f(x) to integrate: ');
a = input('Enter the lower limit of the integral: ');
b = input('Enter the upper limit of the integral: ');
% =====================================
g = inline(f);
n = 1; 
% =====================================
% Real value of integral with Matlab 
I_verdadero = double(int(f,x,a,b)); %1.6405
% =====================================
% Width calculation
h = (b-a); 
% Points
x1 = (a + b)/3;
x2 = 2*(a + b)/3;
% =====================================
% Integration with 1 trapeze
IntSimp = h/8*(g(a) + 3*g(x1) + 3*g(x2) + g(b));
% =====================================
% Integral for the error
E = -1920/(b-a); 
% =====================================
% Cálculo de errores 
Ea = -((b - a)^5*(E))/(6480) ;% Approximate error
ET = abs(I_verdadero - IntSimp);% True Error 
Epsilon_T = abs((I_verdadero - IntSimp)/I_verdadero)*100;  % True relative percentage error £t
% =====================================
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('                                               TABLE OF RESULTS   \n');
fprintf('Intervals \t Approximation Integral \t Ea \t\t Et \t      £t \n');
fprintf('       %d \t\t              %4.3f \t           %4.3f \t            %4.3f \t   %4.3f \t \t                 %4.3f \t\t   \n \n',n,IntSimp,Ea,ET, Epsilon_T); 
fprintf('\n-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('\n Code by Nikolay Murillo, July,2022.\n')
% =====================================
% If you want to test this script you can enter this data
% Enter function f(x) to integrate: 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
% Enter the lower limit of the integral: 0
% Enter the upper limit of the integral: 1
