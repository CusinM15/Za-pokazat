function [x, L, U] = lusolve(A, b)
    % Opis :
    % lusolve izraèuna rešitev sistema A*x = b z uporabo
    % LU razcepa ter premih in obratnih substitucij ob
    % predpostavki , da obstaja LU razcep matrike A brez
    % pivotiranja
    %
    % Definicija :
    % [x,L,U] = lusolve (A,b)
    %
    % Vhodna podatka :
    % A matrika sistema ,
    % b vektor sistema
    %
    % Izhodni podatek :
    % x vektor , ki je rešitev sistema A*x = b,
    % L,U matriki iz LU razcepa A = L*U matrike A
    n = size (A ,1);
    % LU razcep ( brez pivotiranja )
    L = eye (n);
    for j = 1: n -1
        for i = j +1: n
            L(i, j) = A(i, j) / A(j, j);
            for k = j +1: n
                A(i, k) = A (i , k) - L(i, j) * A (j, k);
            end
        end
    end
    U = triu(A);
    % prema substitucija
    y = b;
    for i = 2: n
        for k = 1: i -1
            y(i) = y(i) - L(i, k) * y(k);
        end
    end
    % obratna substitucija
    x = y;
    for i = n : -1: 1
        for k = i + 1: n
            x(i) = x(i) - U(i, k) * x(k);
        end
        x(i) = x(i) / U(i, i);
    end
