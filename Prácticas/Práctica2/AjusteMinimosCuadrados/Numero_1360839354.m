clc

%%VALORES DE X
x =[100 1000 5000 10000 50000 100000 200000 400000 600000 800000 1000000 2000000 3000000 4000000 5000000 6000000 7000000 8000000 9000000 10000000];
 
%%VALORES DE Y = F(x) = Algoritmo de busqueda
lineal = [0.0000069141 0.0000088215 0.0000190735 0.0000321865 0.0001468658 0.0002899170 0.0005779266 0.0011441708 0.0017521381 0.0023250580 0.0028841496 0.0057859421 0.0087409019 0.0115699768 0.0143120289 0.0173830986 0.0202858448 0.0231640339 0.0258131027 0.0291078091];
binaria = [0.0000090599 0.0000071526 0.0000090599 0.0000090599 0.0000159740 0.0000088215 0.0000119209 0.0000121593 0.0000128746 0.0000112057 0.0000109673 0.0000112057 0.0000100136 0.0000109673 0.0000121593 0.0000100136 0.0000109673 0.0000109673 0.0000181198 0.0000109673];
arbol = [0.0000159740 0.0000951290 0.0009350777 0.0022192001 0.0175719261 0.0493669510 0.1648149490 0.4912149906 0.7936129570 1.0926799774 1.4156229496 3.2837510109 5.5693070889 7.4299299717 9.9800839424 11.7766299248 14.4127438068 18.3182029724 19.4010112286 21.3322849274];

%%OBTENER UN POLINOMIO QUE SE AJUSTE A LOS PUNTOS X Y Y
n=3;                                    %%GRADO DEL POLINOMIO DE AJUSTE
polinomioLineal=polyfit(x,lineal,n)     %%FUNCION QUE REALIZA EL AJUSTE POLINOMIAL
polinomioBinario=polyfit(x,binaria,n)   %%FUNCION QUE REALIZA EL AJUSTE POLINOMIAL
polinomioArbol=polyfit(x,arbol,n)       %%FUNCION QUE REALIZA EL AJUSTE POLINOMIAL

%%SE CREA UN ESPACIO PARA REALIZAR UNA GRAFICA EN 
%%DONDE SE COMPARA LA CURVA AJUSTADA CONTRA LOS 
%%VALORES EXPERIMENTALES
xi=linspace(0.72,1.45,100000);                      %%ESPACIO DE PUNTOS PARA Xi
zLineal=polyval(polinomioLineal,xi);				%%EVALUACION DEL POLINOMIO P EN EL ESPACIO Xi
zBinaria=polyval(polinomioBinario,xi);				%%EVALUACION DEL POLINOMIO P EN EL ESPACIO Xi
zArbol=polyval(polinomioArbol,xi);                  %%EVALUACION DEL POLINOMIO P EN EL ESPACIO Xi

%%SE REALIZA LA FIGURA CORRESPONDIENTE
figure(1);

%subplot (Numero_Filas, Numero_Columnas, Numero_Grafica)
subplot (3, 1, 1),plot(x,lineal,'go-',xi,zLineal,'-'),grid, ylabel('Segundos'), xlabel('Tama�o de arreglo'), title('Algoritmo de Busqueda Lineal');
subplot (3, 1, 2),plot(x,binaria,'bo-',xi,zBinaria,'-'),grid, ylabel('Segundos'), xlabel('Tama�o de arreglo'), title('Algoritmo de Busqueda Binaria');
subplot (3, 1, 3),plot(x,arbol,'ro-',xi,zArbol,'-'),grid, ylabel('Segundos'), xlabel('Tama�o de arreglo'), title('Algoritmo Arbol de Busqueda Binaria');
