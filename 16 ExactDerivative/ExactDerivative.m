% Cleaning commands
clc
clear
% =====================================
% Symbolic variable
syms x
% =====================================
f = 1.2 - 0.25*x - 0.5*x^2 - 0.15*x^3 - 0.1*x^4;
% =====================================
% Inputs
xi = input('Ingrese xi: ');%0.5;
h = input('Ingrese h: '); % 0.25;
% =====================================
% Calculate the first derivative
derivada = diff(f,x,1); % Symbolic
derivada_calculada = double(subs(derivada,x,xi)); %Numerical
% =====================================
% Conditions for first approximation
xi_anterior = xi - h; % -1
xi_posterior = xi + h; % -1
% =====================================
% Approximations
% =====================================
% First approach - CENTERED
diferencia_centrada = double((subs(f,x,xi_posterior) - subs(f,x,xi_anterior))/(2*h));
% =====================================
% Conditions second approximation
xi_anterior_2 = xi - 2*h; % -2
xi_posterior_2 = xi + 2*h; %+2
% =====================================
% Second approach - CENTERED
% CENTERED DERIVATIVE
m = double(subs(f,x,xi_posterior_2));
n = double(subs(f,x,xi_posterior));
o = double(subs(f,x,xi_anterior));
p = double(subs(f,x,xi_anterior_2));
diferencia_centrada_2 = double((-1*m + 8*n - 8*o + p)/(12*h));
% =====================================
% Calculation of errors
% First approximation
% True error (Et)
Et_centrada = abs(derivada_calculada - diferencia_centrada);

% Error £t - Relative Percentage Error True
% True relative percentage error first approximation
Ep_centrada = double(abs((derivada_calculada - diferencia_centrada)/derivada_calculada))*100;
% =====================================
% Second approximation
% True error (Et)
Et_centrada_2 = abs(derivada_calculada - diferencia_centrada_2);

% Error £t - Relative Percentage Error True
Ep_centrada_2 = double(abs((derivada_calculada - diferencia_centrada_2)/derivada_calculada))*100;

% Approximate error
Ea = abs((diferencia_centrada_2 - diferencia_centrada)/diferencia_centrada_2);
% =====================================
% Outputs 
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('                                                   DIFERENCIACIÓN CENTRADA  \n');
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('Approximation \t Calculated Value \t        Et \t\t\t   £t \n');
fprintf('    First\t\t                  %1.4f \t\t %1.8f \t\t %1.9f\n',diferencia_centrada, Et_centrada,Ep_centrada);
fprintf('   Second \t\t       %1.4f \t\t %1.8f \t\t %1.9f\n',diferencia_centrada_2, Et_centrada_2 , Ep_centrada_2);
fprintf('With h = %4.2f  \n',h)
fprintf('Approximate error Ea = %1.4f  \n',Ea)
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('\n Code by Nikolay Murillo, July,2022.\n')
% =====================================
% % If you want to try this script, please with this data:
% Enter xi: 0.5
% Enter h: 0.25


