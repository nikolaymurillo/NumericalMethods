% Cleaning commands
clc
clear
% =====================================
% Matrix of coeficientes
A = [10 2 1;
   1 5 1;
   2 3 10];
% =====================================
% Matriz of answers
b = [7 -8 6]'; 
% =====================================
% Vector (initial)
x = [0 0 0]'; 
% =====================================
e = 0.00001; % Error
m = 4;           % Iterations
% =====================================
n = length(x);
disp('       GAUSS - SEIDEL METHOD')

% =====================================
% Bucle 
for k = 1:m 
    w = x;
    
    for i = 1:n
        s = A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x(i+1:n);
        x(i) = (b(i)-s)/A(i,i);
        ea = (x-w)/x;
    end    
    fprintf('\nThe solution in the iteration: %4.0f\n',k)
     
    for i = 1:n
        fprintf('x(%1.0f) = %6.10f\n ',i,x(i))
    end
end
fprintf('\nCode by Nikolay Murillo, July,2022\n'); 
% =====================================
