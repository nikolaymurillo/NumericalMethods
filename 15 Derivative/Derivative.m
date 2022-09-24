% Cleaning commands
clc
clear
% =====================================
% Working with symbolic variable
syms x 
% =====================================
% Function
f = 1.2 - 0.25*x - 0.5*x^2 - 0.15*x^3 - 0.1*x^4;
% =====================================
% Inputs
xi = input('Enter xi: ');%0.5;
h = input('Enter h: '); % 0.25;
% =====================================
% Calculation of true derivative
derivada = diff(f,x,1); % symbolic
derivada_calculada = double(subs(derivada,x,xi)); % numeric
% =====================================
% Conditions
xi_anterior = xi-h; % -1 
xi_posterior = xi+h;
% =====================================
% Difference forward 
diferencia_adelante = double((subs(f,x,xi_posterior) - subs(f,x,xi))/h);

% Difference centered
diferencia_centrada = double((subs(f,x,xi_posterior) - subs(f,x,xi_anterior))/(2*h));

% Difference backward
diferencia_atras = double((subs(f,x,xi) - subs(f,x,xi_anterior))/h);
% =====================================
% Calculations of errors
% True Error  (Et)
% True forward error 
Et_adelante = abs(derivada_calculada - diferencia_adelante);

% True backward error
Et_atras = abs(derivada_calculada - diferencia_atras);

% True centered error
Et_centrada = abs(derivada_calculada - diferencia_centrada);
% =====================================
% Error £t - Relative Percentage Error True 
% True forward relative percent error
Ep_adelante = double(abs((derivada_calculada - diferencia_adelante)/derivada_calculada)) * 100;

% True centered relative percentage error
Ep_centrada = double(abs((derivada_calculada - diferencia_centrada)/derivada_calculada))*100;

% True backward relative percent error
Ep_atras = double(abs((derivada_calculada - diferencia_atras)/derivada_calculada))*100;
% =====================================
% Output 
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('                                                   SIMPLE DIFFERENTIATION   \n');
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('Type of difference  \t Calculated Value \t        Et \t\t\t   £t \n');
fprintf('   Forward \t\t     %1.4f \t\t %1.8f \t\t %1.9f\n',diferencia_adelante, Et_adelante, Ep_adelante);
fprintf('  Backward \t\t    % 1.4f \t\t %1.8f \t\t %1.9f\n',diferencia_atras, Et_atras, Ep_atras);
fprintf('  Centered \t\t    %1.4f \t\t %1.8f \t\t %1.9f\n',diferencia_centrada, Et_centrada, Ep_centrada);
fprintf('With h = %4.2f  \n',h)
fprintf('-----------------------------------------------------------------------------------------------------------------------------------  \n');
fprintf('\n Code by Nikolay Murillo, July,2022.\n')
% =====================================
% % If you want to try this script, please with this data:
% Enter xi: 0.5
% Enter h: 0.25