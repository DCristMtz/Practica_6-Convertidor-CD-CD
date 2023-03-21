freq=100000;
off=0;
ampl=1;
trab=40;
t_pwm = linspace(0,0.01,10000); %Espaciado que da mejores resultados

PWM = (ampl/2)+(ampl/2)*square(2*pi*freq.*t_pwm+off,trab); %Onda cuadrada que va de 0 a 1
plot(t_pwm,PWM)

%u=@(t)interp1(x,u,t); 
%PROBLEMA: u(t) dentro de la funcion no se actualiza a cada momento en el tiempo
%PROBLEMA 2: Cundo interpolo ut, me da una grafica drasticamente diferente
%SOLUCIÓN: El resultado raro de la interpolacion era culpa de la calidad
%del PWM de entrada

[t,y] = ode45(@(t,y) E1_Practica6(t,y,t_pwm,PWM),[0 0.01],[0 0]); %Formato generico para funciones de multiples parametros

figure(1)
plot(t,y(:,1));
hold on
plot(t,y(:,2));
hold off
grid on
title("Relacion de corriente y voltaje")
xlabel("Tiempo")
ylabel("Volts/Amps")
legend('Corriente de inductor','Voltaje de capacitor')




