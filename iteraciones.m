function [ Distancias ] = iteraciones(centroide1, centroide2, centroide3, matriz)
    
    Distancias = zeros(length(matriz(:, 1)), 1);
    segunda = matriz(:, 5);
    vueltas = 0;
    n = 0;
    
    while(n == 0)
        
        %1 hasta 150
        for r = 1 : length(matriz(:, 1))

            distanciaC1 = 0;
            distanciaC2 = 0;
            distanciaC3 = 0;

            %1 hasta 4
            for c = 1 : length(matriz(1, :))-1
                
                %Calculo de distancia euclidiana
                distanciaC1 = (matriz(r, c) - centroide1(1, c))^2 + distanciaC1;
                distanciaC2 = (matriz(r, c) - centroide2(1, c))^2 + distanciaC2;
                distanciaC3 = (matriz(r, c) - centroide3(1, c))^2 + distanciaC3;     

            end    
            
            %Llenando matriz de resultados 
            if( (distanciaC1 < distanciaC2) && (distanciaC1 < distanciaC3) )
                Distancias(r, 1) = 1;
            else if( (distanciaC2 < distanciaC1) && (distanciaC2 < distanciaC3) )
                    Distancias(r, 1) = 2;
                else
                    Distancias(r, 1) = 3;
                end  
            end

        end  
        
        %Matrices de cada clase
        k1 = Distancias(:, 1) == 1;
        valoresK1 = matriz(k1, :);
        
        k2 = Distancias(:, 1) == 2;
        valoresK2 = matriz(k2, :);
        
        k3 = Distancias(:, 1) == 3;
        valoresK3 = matriz(k3, :);

        %Calculando nuevos centroides
        %1 hasta 4
        for c = 1 : length(matriz(1, :))-1
           centroide1(1, c) = mean(valoresK1(:, c));
           centroide2(1, c) = mean(valoresK2(:, c));
           centroide3(1, c) = mean(valoresK3(:, c));
        end
        
        %Condicional para detener el proceso una vez que convergan las 2
        %matrices
        if( segunda == Distancias )
            n = 1;
        end

        segunda = Distancias;
        vueltas = vueltas + 1;
    end
 
end