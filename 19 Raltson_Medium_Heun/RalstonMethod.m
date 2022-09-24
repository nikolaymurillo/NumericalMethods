% Cleaning commands
clc
clear
% =====================================
% Working with symbolics variable
syms x y
disp(' ------------------------------------------------------------------------')
disp(' RALTSON METHOD FOR SOLVING AN EDO')
% y’ = –2x3 + 12x2 – 20x + 8.5
fxy =  -2*x^3 + 12*x^2 - 20*x + 8.5;
x0 = 0;
y0 = 1;
h = 0.5; % Paso
n = 8;
M = zeros(n,4);
disp(' ------------------------------------------------------------------------')
disp('         x         Y_Rals    Y_Ver      Et %')
disp(' ------------------------------------------------------------------------')
y_verdadero = [3.21875;3;2.2187; 2; 2.71875; 4; 4.71875; 3 ];
length(y_verdadero);
for i = 1: n
    k1 =  subs(fxy,[x y], [x0 y0]);
    k2 =  subs(fxy,[x y], [x0+3*h/4  y0+k1*3*h/4]);
    %     K3 =  subs(fxy,[x y], [x0+h/2 y0+K1*h/2]);
    %     K4 = subs(fxy,[x y], [x0+h y0+K3*h]);
    y_sig = double(y0 + h*(1/3*k1 + 2/3*k2));
    x0 = x0 + h;
    y0 = y_sig;
    M(i,3) = y_verdadero(i);
    M(i,1) = x0;
    M(i,2) = y_sig;
    error_verdadero =abs((y_verdadero - y0)/y0*100);
    %     error = error_verdadero(:,7);
    M(i,4) = error_verdadero(i);
end
disp(M)
disp(' ------------------------------------------------------------------------')
x = M(:,1);
r = M(:,2);
plot(x,r,'g -o',LineWidth=2)
hold on
title('RALTSONMETHOD FOR SOLVING AN EDO')
plot(x,y_verdadero,'r-o',LineWidth=2)
legend('Y_RK Ralston','Y_True')
% =====================================
fprintf('Code by Nikolay Murillo, July,2022.\n')
