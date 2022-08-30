function mat = simerticna(n)
    %sprejme n vrne pa simetrično matriko n*n
    M = tril(randi([0 9], n),-1);
    mat = M + M' + eye(n);
end