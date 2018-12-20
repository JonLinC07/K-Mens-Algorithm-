addpath('C:\Users\ojmlc\Documents\Universidad\VII\Data Mining\K-Means');
fileName = 'irisL.csv';
Casos = csvread(fileName);

%Creando centroides aleatorios 
centroide1 = getCentroide(Casos);
centroide2 = getCentroide(Casos);
centroide3 = getCentroide(Casos);

%Obteniendo iteraciones
distancia = iteraciones(centroide1, centroide2, centroide3, Casos);
 
matrizClase1 = Casos([1 : 50], 5);
matrizClase2 = Casos([51 : 100], 5);
matrizClase3 = Casos([101 : 150], 5);

matrizDistancia1 = distancia([1 : 50], 1);
matrizDistancia2 = distancia([51 : 100], 1);
matrizDistancia3 = distancia([101 : 150], 1);

%porcentaje de acierto por centroide
aciertoCentroide1 = sum(matrizClase1 == matrizDistancia1) / length(matrizClase1);
aciertoCentroide2 = sum(matrizClase2 == matrizDistancia2) / length(matrizClase2);
aciertoCentroide3 = sum(matrizClase3 == matrizDistancia3) / length(matrizClase3);

%Porcentaje de acierto total
aciertoTotal = sum(distancia(:, 1) == Casos(:, 5)) / length(Casos(:, 5));

