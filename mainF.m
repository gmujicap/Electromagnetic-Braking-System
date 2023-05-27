% Main Primer Entregable Reto Campo Magnético
% Gabriel Ernesto Mujica Proulx A01285409
% Roberto Raymundo Gómez Vargas A01285451
% Rodrigo García Torres A00835513


% N = input("Ingresa cantidad de divisiones: ");
% I = input("Ingresa la corriente: ");
% R = input("Ingresa radio: ");
% x = input("Ingresa x: ");
% y = input("Ingresa y: ");
% z = input("Ingresa z: ");

%Parámetros de entrada para el cálculo del campo magnético en un
%punto, incluyendo la corriente, radio, y posición. 
N = 1000;
I = 2;
R = 10;
x = 0;
y = 0;
z = 0;

%Valores de entrada para visualizeCampo(), que designan
%el tamaño del espacio a analizar
Ny = 25;
Nz = 25;
zmin = -50;
zmax = 50;
ymin = -50;
ymax = 50;

%función que calcula el campo magnético en un punto
getCampoMagnetico(I,R,N,x,y,z)

%función que grafica el campo magnético en una malla
visualizeCampo(Ny, Nz, ymin, ymax, zmin, zmax, I, R, N, x, y, z)

