function [ Centroide ] = getCentroide(matriz)

    Centroide = zeros(1, length(matriz(1, :))-1);
    
    for c = 1 : length(matriz(1,:))-1
        
        x = round(rand * length(matriz(:, 1) - 1) + 1);
        Centroide(1, c) = matriz(x, c);        
                       
    end

end 