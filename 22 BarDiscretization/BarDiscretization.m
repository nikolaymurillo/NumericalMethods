% Cleaning commands
clc
clear
% ====================================================================
% Format
format short g
%  =====================================================================
disp(' ====================================================== ')
disp('                              DISCRETIZATION OF A BAR  ')
disp('                                BY FINITE ELEMENT ')
disp(' ====================================================== ')
%=============================INPUTS===================================
e = input("Enter the number of bar elements: ");          % Número de elementos deseados
Lo = 0.1 ; %[m]                                                             % Bar length
X = Lo/e; %[m]                                                              % Length of individual elements
Ao = 0.5;  %[m]                                                             % Area of the initial cross section at X=0
E = 210*(10^9); %[Pa]                                                  % Modulus of Elasticity
n = e + 1;                                                                      % Number of nodes
F = zeros(n,1);                                                     
F(n) = 44482.22; %[N]                                                 Tensile strength
P = 44482.22;
%======================OVERALL STIFFNESS MATRIX========================
k_l = [1,-1; -1,1]; % Local stiffness matrix
K = zeros(n, n);  % Generate nxn matrix

for i = 1:e
    % Generation of the average cross-sectional area of each element
    A(i) = (Ao*(1-0.5*(i-1)*X/Lo)+Ao*(1-0.5*(i)*X/Lo))/2; 

    % Generation of local stiffness matrices k
    k(i) = A(i)*E/X;

    % Generation of the global stiffness matrix K
    K(i:i+1,i:i+1) = K(i:i+1,i:i+1)+ k(i)*k_l;

end
%======================================================================
% Fixed node at the left end of the member
fixed_nodes = [1]; 
free_nodes = setxor(1:n,fixed_nodes);

% Reduced overall stiffness matrix
Kred = K(free_nodes,free_nodes); 

% Reduced force matrix
Fred = F(free_nodes,1); 

%============================= Displacements =====================
% Matrix of the reduced vector after partitioning
ured = Kred\Fred; 

% Displacement matrix
U = zeros(n,1); % displacment vector matirx
U(free_nodes)= ured; %displacement of free-end is last value in matrix

% Calculation of forces 
F = K*U;
%======================================================================
% Loop for validating results
m_bar = [0:0.01:0.1];
length(m_bar);

for jj = 1:11

    % Plots analytical solution
    b = 1.386*(P*m_bar)/(E*Ao);

    % Plots with 1 bar element
    t  = 4/3*(P*m_bar)/(E*Ao);

    % Plots with 2 bar element
    u = 1.371*(P*m_bar)/(E*Ao);

    % Plots
    plot(m_bar,b, 'red-o',LineWidth=2)
    hold on
    plot(m_bar,t, 'g-o',LineWidth=2) 
    plot(m_bar,u, 'b-o',LineWidth=2) 
end
%======================================================================
title("DISPLACEMENTS ALONG A BAR UNDER TENSILE LOAD")
xlabel("Bar length [m]")
legend("Actual displacement", "Displacement with 1 element","Displacement with 2 element")
ylabel("Displacement [m]")
%======================================================================
% Resultados
disp("Displacements, U in meters [m].")
U
disp("Forces, F in Newtons [N].")
F



