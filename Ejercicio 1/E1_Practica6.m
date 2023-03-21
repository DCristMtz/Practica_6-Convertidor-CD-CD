function dx = E1_Practica6(t,x,ut,u)

%Definicion de los parametros
l = 2e-3;
r = 10;
c = 10e-6;
vin = 32;

u = interp1(ut,u,t); %Interpolar valores en u

%Salida de la ecuacion (desde x1,x2, hasta la segunda derivada de x1,x2)
dx = zeros(2,1);

%%Definicion de la dinamica del sistema representada en espacio de estados
dx(1) = 1/l*(vin*u-x(2));
dx(2) = 1/c*(x(1)-x(2)/r);     

end