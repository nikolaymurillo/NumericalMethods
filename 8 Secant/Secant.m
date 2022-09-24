% Cleaning commands
clc
clear
% =====================================
% Format
format short
% =====================================
% Working with a symbolic variable
syms x
% =====================================
% Function
f = exp(-x)-x;
% =====================================
% Inputs
xi_1 = input('Enter the value of xi-1: ');
xi = input('Enter a initial value xi: ');
iteraciones = 10;
Q = [];
jj = 0;
% =====================================
for jj = 1:iteraciones
    fxi = subs(f,x,xi);
    fxi_1 = subs(f,x,xi_1);
    ximas1 = xi-((fxi*(xi_1-xi))/(fxi_1-fxi));
    ximas1 = double(ximas1);
    Ea = double(abs((xi-xi_1)/xi))*100;
    Q(jj,:) = [jj ximas1 Ea];
    xi_1 = xi;
    xi = ximas1;
    jj = jj+1;
end
% =====================================
fprintf(' -----------------------------------------\n' )
fprintf('          SECANT METHOD\n' )
fprintf('          n          Root        Ea\n' )
disp(Q)
fprintf(' -----------------------------------------\n' )
fprintf('Code by Nikolay Murillo, July 2022.')
% =====================================
% If you want to test this script, please with this data:
% Enter the value of xi-1: 0
% Enter a initial value xi: 1



