% Cleaning commands
clc
clear
% =====================================
% Function
f = '0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5';
% =====================================
a = 0;          % lower
b = 0.8;        % upper
n = 100;        % Domain partition
% =====================================
disp('      TRAPEZIUM RULE: MULTIPLE APPLICATION ');
disp('Function ');
f
disp(strcat('From [a =',num2str(a),' to b = ',num2str(b),']'));
f = inline(f); % Leer la función
% =====================================
h = (b-a)/n;   % Ancho
aprox = f(a)+f(b); % Cálculo de la aproximación de la integral
fprintf('--------------------------------------------\n' )
fprintf('   Trapezium Rule: Multiple Application\n' )
k = 0;
% =====================================
for i = 1:n-1
    k = k + 1;
    i_verdadero = 1.6416;
    x = a + i*h;
    aprox = aprox + 2*f(x);
    error_aproximado = -(b-a)^3*(-60)/(12*pi)*100;
    I_verdadero = 1.6416;
    error_verdadero = abs((I_verdadero-aprox)/I_verdadero);
    a = 0;
end
aprox = (h/2)*aprox;a=0;
% =====================================
fprintf('n is:\t%4.3f \n',n)
fprintf('The approach is:\t %4.3f\n',aprox)
fprintf('The approximate error is:\t %4.3f\n',error_aproximado)
fprintf('The real error:\t %4.3f\n',error_verdadero)
fprintf('--------------------------------------------\n' )
fprintf('Code by Nikolay Murillo,2022.')

