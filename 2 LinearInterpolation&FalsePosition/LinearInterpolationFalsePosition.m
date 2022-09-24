% Cleaning commands
clc
clear
% =====================================
%Symbolic variable
syms x
% =====================================
f = x^10 - 1; % the function
% =====================================
y = f; %f(x)
yy = double(subs(y,x,-10:0.1:10));
a = input('Enter a: '); % minor interval
b = input('Enter b: ');  % major interval
ea = 0.1/100; % error
ee =100; % maximum error
tic; % time of processing
% =====================================
if subs(y,x,a)*subs(y,x,b)>0
    error('there are no roots in that interval')
end
n = 1; %counter of iterations
mm = 0;

while ee>ea
    m = b-((subs(y,x,b)*(a-b))/(subs(y,x,a)-subs(y,x,b))); %Approximate root
    if subs(y,x,a)*subs(y,x,m)<0 %Evaluate the approximate root
        b = m;
    else
        a = m;
    end
    ee = abs((m-mm)/m)*100;
    mm = m;
    n = n + 1;
    time = toc;
end
% =====================================
fprintf('Number of iterations required: %4.2f \n', n)
fprintf('Error = %8.5f\n', ee)
fprintf('Time of processing = %8.5f\n', time)
fprintf('Code by Nikolay Murillo, 2022.')
% =====================================
