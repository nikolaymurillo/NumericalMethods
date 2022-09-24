% Cleaning commands
clc
clear
% =====================================
% Inputs
fprintf('\n \tSOLUTION OF DIFFERENTIAL EQUATIONS BY EULER METHOD\n')
f = input('\n Enter the differential equation of the form dy/dx=f(x,y):','s');
x0 = input('\nEnter the first point x0: ');
x1 = input('\nEnter the second point x1: ');
y0 = input('\nEnter the initial condition y(x0): ');
% =====================================
h = 0.5;
xs = x0:h:x1;
y1 = y0;
% =====================================
fprintf('it     x0         y1');
for i = 1:8
    it = i - 1;
    x0 = xs(i);
    x = x0;
    x1 = xs(i+1);
    y = y0;
    y1 = y0+h*eval(f);
    fprintf('\n%2.0f %10.6f %10.6f %10.6f\n',it,x1,y1);
    y0 = y1;
end
% =====================================
x_v = 0:0.5:4;
length(x_v);
yeuler = [ 1 5.25 5.87 5.12 4.50 4.75 5.87 7.12 7];
length(yeuler);
yverdadero = [1 3.21 3 2.21 2 2.71 4 4.71 3];
length(yverdadero);
fprintf('\n The approximate point y(x1) is = %10.6f\n',y1)
plot(x_v,yeuler,'g',LineWidth=2);
hold on
title('SOLUTION OF DIFFERENTIAL EQUATION', 'Euler vs Real')
legend('Euler','True')
plot(x_v,yverdadero,LineWidth=2)
fprintf('\n Code by Nikolay Murillo, July,2022.\n')
% =====================================
% If you want to test this script you can try with this data
%  Enter the differential equation of the form dy/dx=f(x,y): -2*x^3 + 12*x^2 - 20*x + 8.5
% Enter the first point x0: 0
% Enter the second point x1: 4
% Enter the initial condition y(x0): 1
