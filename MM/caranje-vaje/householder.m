function [Q, R] = householder(A)
    % Q * R = A
    [m, n] = size(A);
    Q = eye(m);
    for j = 1: n
        k = norm(A(j: m, j));
        ksi = k * (k + abs(A(j, j)));
        w = A(j: m, j);
        predznak = 1;
        if w(1) < 0
            predznak = -1;
        end
        w(1) = w(1) + k * predznak;
        A(j: m, j: n) = A(j: m, j: n) - (1 / ksi) * w * (w' * A(j: m, j: n));
        Q(j: m, :) = Q(j: m, :) - (1 / ksi) * w * (w' * Q(j: m, :));
    end
    Q = Q';
    R = A;
    
        

