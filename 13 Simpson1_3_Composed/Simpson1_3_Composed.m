% Cleaning commands
clc
clear
% =====================================
% Working with symbolic variable
syms x 
format default
% --------------------------------------------------------------------------------
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('                                                                  SIMPSON RULE 1/3    \n');
fprintf('                                                                 MULTIPLE APPLICATION    \n');
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
% =====================================
% Inputs
f = input('Enter the function f(x) to be integrated: ');
a = input('Enter the lower limit of the integral: ');
b = input('Enter the upper limit of the integral : '); 
n = input('Enter the number of intervals, must be PAR: ');
% =====================================
% Calculation of the width
h = (b - a )/n;
% =====================================
% Stop criteria
if rem(n,2) == 1
    fprintf('  \nEnter a valid number, must be PAR');
    n = input('  \nnEnter the number of intervals, must be PAR:: ');
end
% =====================================
suma1 = 0;
suma2 = 0; 
% =====================================
for k = 1: n-1
    if rem(k,2) == 0
        suma1 = suma1 + subs(f,a + k*h);
    else 
        suma2 = suma2 + subs(f,a + k*h);
    end
end
% =====================================
 % Numerical calculate with computer
IntSimp = (h/3)*double(subs(f,a) + subs(f,b)  + 2*suma1+ 4*suma2);
% =====================================
% Numerical calculate with calculator
I_verdadero = double(int(f,x,a,b));
% =====================================
% Calculate errors
% Approximate numerical error
Ea = - ((b - a)^5*(-2400)) / (180*n^4);

% Ea = Ea; % error in percentage
% Real error
Et = abs((I_verdadero - IntSimp)/I_verdadero);
% --------------------------------------------------------------------------------
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('                                                                     TABLE OF RESULTS  \n');
fprintf('Intervals \t\tIntegral Approach \t\t Approximate Error \t\t True Error \n');
fprintf('       %d \t\t\t        %1.6f \t\t        %1.6f \t\t   %1.6f \t\t %      1.6f \t\t \n\n',n,IntSimp,Ea,Et); 
fprintf('\n-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('\n Code by Nikolay Murillo, July,2022.\n')
% =====================================
% If you want to test this script, please with this data:
% Enter the function f(x) to be integrated: 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5
% Enter the lower limit of the integral: 0
% Enter the upper limit of the integral : 1
% Enter the number of intervals, must be PAR: 8












