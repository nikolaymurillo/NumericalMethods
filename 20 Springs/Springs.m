% Cleaning commands
clc
clear
% =====================================
% Constants of springs
k1 = 200;
k2 = 400;
k3 = 600;
k4 = 800;
k5 = 1000;
% =====================================
% Forces
f2 = 2000;
f4 = 4000;
% =====================================
u1 = 0;
u3 = 0;
% =====================================
disp(' ----------------------------------------------------------------')
disp('   RESOLUTION OF A SPRING SYSTEM ')
disp('        WITH NUMERICAL METHOD ')
disp(' ----------------------------------------------------------------')
fprintf('Starting from the global stiffness matrix:\n')
K_sym = [k1,-k1,0,0;-k1,k1+k2+k3+k4,0,-k2-k3-k4;0,0,k5,-k5;0,-k2-k3-k4,-k5,k2+k3+k4+k5]; 
disp(K_sym)
% =====================================
fprintf(' ave to solve a matrix system of the form F = K*U;\n')
% =====================================
% Analyzing the submatrices, we have that: 
f_sub = [f2;f4];
% =====================================
% And the constants
k_sub=[k1+k2+k3+k4 -k2-k3-k4;-k2-k3-k4 k2+k3+k4+k5];
% =====================================
u_sub = inv(k_sub)*f_sub;
% =====================================
% Matrix U
U = [u1;u_sub(1,:);u3;u_sub(2,:)];
u2 = u_sub(1,:);
u4 = u_sub(2,:);
% =====================================
% Finally, the matrix F
fprintf(' Finally, the matrix F:\n')
F = K_sym*U;
F
fprintf('And the matrix U, :\n')
U
f1=F(1,1);
f3=F(3,1);
disp(' ----------------------------------------------------------------')
