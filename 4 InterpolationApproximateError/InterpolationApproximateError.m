% Cleaning commands 
clc
clear
% =====================================
% Symbolic variable
syms x
% =====================================
f = (x.^10) - 1; % the function to analyze 
% =====================================
y = f; %f(x)
yy = double(subs(y,x,0:0.1:3));
a = input('Enter a: '); % intervalo menor
b = input('Enter b: ');  % intervalor mayor
ea = 0.01/100; % error 
ee =1; % maximum error
tic; %to count the time ejecuting
% =====================================
if subs(y,x,a)*subs(y,x,b)>0
    error('There are not roots in this interval')
end
n = 1; %count the iterations
mm = 0;
while ee>ea
    root = b-((subs(y,x,b)*(a-b))/(subs(y,x,a)-subs(y,x,b))); % approximate root
    if subs(y,x,a)*subs(y,x,root)<0 % evaluate the approximate root
        b = root;
    else
        a = root;
    end
    ee = abs((root-mm)/root)*100;
    mm = root;
    n = n + 1;
    tiempo = toc;
end
% =====================================
fprintf('---------------------------------------------------- \n')
fprintf('               INTERPOLATION METHOD \n')
fprintf('Approximate root: %4.2f \n', root )
fprintf('Number of iterations: %4.2f \n', n)
fprintf('Error = %8.5f\n', ee)
fprintf('Time of processing = %8.5f\n', tiempo)
fprintf('----------------------------------------------------\n')
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
% If you want to test this script, please with this data:
% Enter a: 1
% Enter b: 2