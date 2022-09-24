% Cleaning commands
clc
clear
% ====================================================================
% Format
format short
% ====================================================================
disp(' --------------------------------------------------------------------------------------')
disp('                     2D BAR TYPE ELEMENT RESOLUTION ')
disp('                                  STIFFNESS METHOD ')
disp('                          RESOLUTION OF AN ARMATURE ')
disp(' --------------------------------------------------------------------------------------')
% ====================================================================
% Inputs
numelementos = 3;                             % Number of elements
E(1:numelementos) =200*10^9;        % Modulus of elasticity per element [m^2].
area(1:numelementos) = 6*10^-4;      % Areas of each element [m^2].
nodos=[0 0 ; 0 3; 3 3; 3 0];                  % Coordinates of each node [m].
UnionNodos=[1 2;1 3;1 4];                  % Nodes linking each element
Desplazamientos=[1 1 0 0 0 0 0 0];    % Displacements per node
Fuerzas=[0 -50000 0 0 0 0 0 0 ];         % Forces per node [Pa].
% ====================================================================
% Construction of the stiffness matrices for each member.
L = zeros(1,numelementos);              % Length vector
grados = zeros(1,numelementos);     %We initialize the vector of inclinations
% ====================================================================
for i = 1:numelementos
    indice = UnionNodos(i,:);
    b = nodos(indice(2),:);           %Take Y2 y Y1
    a = nodos(indice(1),:);           %Take X2 y X1
    L(i) = norm(b-a);                    %Length using the distance between two points

    %Angle of the element with respect to the horizontal
    dx = nodos(indice(2),1) - nodos(indice(1),1);
    dy = nodos(indice(2),2) - nodos(indice(1),2);

    %Determinamos en qué cuadrante se encuentra el elemento
    grados(i) = atand(dy/dx);                              % Quadrant 1
    if sign(dy)==1 && sign(dx)==-1                     % Quadrant 2
        grados(i) = 180+grados(i);
    elseif dy==0 && sign(dx)==-1      %Above horizontal but in quadrant 2
        grados(i)=180;
    elseif sign(dy)==-1 && sign(dx)==-1              %Quadrant 3
        grados(i)=180+grados(i);
    elseif sign(dy)==-1 && sign(dx)==1                %Quadrant 4
        grados(i)=360+grados(i);
    end
end
% ====================================================================
disp('The length of the elements in meters (cathetus, hypotenuse, cathetus):')
L
% ====================================================================
disp(' --------------------------------------------------------------------------------------')
disp('The degrees to which each element is found:')
grados
% ====================================================================
disp(' --------------------------------------------------------------------------------------')
disp('Constant - factor (AE/L) for each element:')
k = (E.*area)./L                           %Constant - factor (AE/L) for each element:
% ====================================================================
disp(' --------------------------------------------------------------------------------------')
disp('We have the different k (4x4 matrices) for each element:')
k1 = transformadalineal(90)
k2 = transformadalineal(45)
k3 = transformadalineal(0)
% ====================================================================
disp(' --------------------------------------------------------------------------------------')
disp('We have the different k (4x4 matrices) for each element multiplied by its AE/L factor:')
m = k(1)*k1
n = k(2)*k2
o = k(3)*k3
% ====================================================================
% Assembly of the global stiffness matrix.

A=zeros(4,4,numelementos);     %We initialize the stiffness matrices for each element
for i=1:numelementos
    %Calculation of the stiffness matrix of each element (AE/L)*k_local
    A(:,:,i)=k(i)*transformadalineal(grados(i));  

    % We convert the array A into cells but the 4x4 matrices of A are converted to cells.
    % we divide into 4 packages of 2x2
    j=UnionNodos(i,:);                      %Index pair of each element
    B(:,:,i)=mat2cell(A(:,:,i),[2 2],[2 2]);

    %We assign each package in the corresponding indexes of the matrix
    C(j(1),j(1),i)=B(1,1,i);
    C(j(1),j(2),i)=B(1,2,i);
    C(j(2),j(1),i)=B(2,1,i);
    C(j(2),j(2),i)=B(2,2,i);
end
disp(' --------------------------------------------------------------------------------------')
% ====================================================================
S=2*size(nodos,1);                          %Dimensions of the global matrix
m=cell(S/2,S/2);
% ====================================================================
for i=1:size(nodos,1)
    for j=1:size(nodos,1)
        %In each round we collect all the elements with the same index.
        %(i,j), we superimpose them and add them together.
        clear x
        x(:,:,:)=cell2mat(reshape(C(i,j,:),1,[],numelementos));
        m(i,j)={sum(x,3)};

        %If in that index (i,j) no packet was assigned, we put a packet of zeros of 2x2
        if size(m{i,j})==[0 0]
            m(i,j)={zeros(2,2)};
        end
    end
end
% ====================================================================
disp('The global stiffness matrix:')
MG=cell2mat(m)          % We convert the global array to a numerical array
disp(' --------------------------------------------------------------------------------------')
% ====================================================================
%Reduce global matrix
v=find(Desplazamientos==0);
MGR=MG;
MGR(v,:)=0;
MGR(:,v)=0;
indicefil=zeros(1,S);
indicecol=zeros(1,S);
% ====================================================================
for i=1:S
    if MGR(i,:)==0
        indicefil(i)=i;
    end
    if MGR(:,i)==0
        indicecol(i)=i;
    end
end
% ====================================================================
disp('Rows and columns of zeros are eliminated to obtain a reduced global matrix:')
MGR(indicefil~=0,:)=[];    %Eliminate rows and columns of zeros to have a reduced global matrix
MGR(:,indicecol~=0)=[]
disp(' --------------------------------------------------------------------------------------')
% ====================================================================
disp('In addition, a force matrix in Newtons [N] is presented. ')
Fuerzas(indicefil~=0)=[]  %Delete rows and columns of zeros from forces
% ====================================================================
disp(' --------------------------------------------------------------------------------------')
% Calculate the nodal displacements in both directions
d=MGR\Fuerzas';
dfinal=zeros(S,1);
k=1;
for i=1:length(Desplazamientos) %Insert the calculated displacements into the original vector of displacements.
    if Desplazamientos(i)==0
        dfinal(i,1)=0;
    else
        dfinal(i,1)=d(k);
        k=k+1;
    end
end
% ====================================================================
%Vector of coefficients [-C -S C S] for stress calculation
Ve={@(x) -cosd(x) @(x) -sind(x) @(x) cosd(x) @(x) sind(x)};

esfuerzosC=zeros(numelementos,4);
for i=1:numelementos
    for j=1:4
        esfuerzosC(i,j)=feval(Ve{1,j},grados(i)); %Evaluate Go for each grade of each element
    end
end

% ====================================================================
% Results
d2=mat2cell(dfinal,2*ones(1,size(nodos,1)),1); %We divide dfinal into packs of 2x1
Esfuerzos=zeros(1,numelementos);
Flocal=zeros(numelementos,4);
j=1;
for i=1:numelementos     %Calculate the stresses per element
    indice=UnionNodos(i,:);
    Esfuerzos(i)=(E(i)./L(i))*esfuerzosC(i,:)*[d2{indice(1,1)};d2{indice(1,2)}];
    Flocal(i,:)=A(:,:,i)*[d2{indice(1,1)};d2{indice(1,2)}];
    j=j+2;
end
% ====================================================================
disp(['Finally, the deformations are presented in meters [m]. '])
dfinal                              %Imprimir resultados
disp(' --------------------------------------------------------------------------------------')
Esfuerzos
disp(' --------------------------------------------------------------------------------------')
disp(['Global reactions: '])
Reacciones=MG*dfinal               %Reacciones globales
disp(' --------------------------------------------------------------------------------------')
disp(['Reactions per element in N: '])
Flocal                    %Reacciones locales por elemento
disp(' --------------------------------------------------------------------------------------')
% ====================================================================