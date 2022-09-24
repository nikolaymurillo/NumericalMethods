% Escuela PolitÃ©cnica  Nacional
% Author: Nikolay Murillo
% Date: 08 de Agosto, 2022
% Método de Euler para EDOs
% -------------------------------------------
clc
clear
% -------------------------------------------
x0 = 1; % Condición inicial 
t0 = 0; % Intervalo inicial
tf = 4; % Intervalo final 
dt = 0.5;% paso
n = (tf - t0)/dt;
% -------------------------------------------
t(1) = t0;
x(1) = x0;
% -------------------------------------------
for i = 1:n
    t(i+1) = t(i) + dt;
    fx = edo(x(i));
    x(i+1) = x(i) + fx*dt;
end
% -------------------------------------------
plot(t,x)






