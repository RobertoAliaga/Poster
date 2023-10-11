#Se cargan los datos del mono C
C = load("Cousteau_tt.mat");

#Se encuentran los indices de cada condicion
ind = zeros(20,1);
for i = 1:20
  ind(i) = find(C.Pc.mask.condNum==i)(end);
end

#Se grafica una condicion de ejemplo. Corresponde a la condicion 1
#C.Pc.mask.condNum -> Numero de condicion (de 1 a 20)
#C.Pc.mask.time -> Tiempo con respecto al inicio del movimiento (en seg)
#C.Pc.mask.dist -> Cantidad de ciclos (7, 4, 2, 1 o 0.5)
#C.Pc.mask.dir -> Direccion del movimiento (hacia adelante 1, hacia atras -1)
#C.Pc.mask.pos -> Posicion de inicio (desde abajo 0, desde arriba 0.5)

#(mono C, 7 ciclos, desde abajo, hacia adelante)

#Se busca el momento de inicio del movimiento
#Se dibuja una recta en cada una de los graficos
t0 = find(C.Pc.mask.time(1:ind(1))==0);

#Velocidad del pedal
#Horizontal
subplot(3,1,1)
 hold on
 plot(C.Pc.vA(1:ind(1),1))
#Vertical
 plot(C.Pc.vA(1:ind(1),2))
#Inicio del movimiento
 plot([t0,t0],[-0.03,0.02],"-y","LineWidth",1.5)

 legend("Horizontal velocity","Vertical velocity")
 xlabel("Time [ms]")
 ylabel("Velocity")
 title("Hand velocity on a 7-cycles movement")
 hold off


#Posicion del pedal
#Horizontal (se mueve hacia atras)
subplot(3,1,2)
 hold on
 plot(C.Pc.pA(1:ind(1),1))
#Vertical (inicia abajo)
 plot(C.Pc.pA(1:ind(1),2))
 #Inicio del movimiento
 plot([t0,t0],[-1,1],"-y","LineWidth",1.5)

 legend("Horizontal position","Vertical position")
 xlabel("Time [ms]")
 ylabel("Position")
 title("Hand position on a 7-cycles movement")
 hold off

#Hay 116 neuronas. La matriz C.Pc.xA contiene 116 columnas, donde cada
#una corresponde a la actividad de esa neurona en las 20 pruebas
#concatenadas.
#Los datos ya estan centrados, normalizados y lo que se presenta es un
#promedio entre las iteraciones de una misma prueba.
#Todos los datos se tomaron a 1 kHz, es decir, cada 1 ms.

#Se escogen 4 neuronas
#Se grafica el correspondiente a las mismas condiciones de movimiento
#Neuronas 10, 27, 43 y 99
subplot(3,1,3)
hold on
plot(C.Pc.xA(1:ind(1),10),"g")
plot(C.Pc.xA(1:ind(1),27),"m")
plot(C.Pc.xA(1:ind(1),43),"k")
plot(C.Pc.xA(1:ind(1),99),"c")
#Inicio del movimiento
 plot([t0,t0],[-0.4,0.8],"-y","LineWidth",1.5)
xlabel("Time [ms]")
ylabel("Neuronal activity")
title("Activity of example neurons on a 7-cycles movement")
legend("10th neuron", "27th neuron", "43rd neuron", "99th neuron")
hold off






