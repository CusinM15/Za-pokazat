function B = bezierOdvod(b,t)
% function B = bezierOdvod(b,t)
% bezierOdvod izračuna odvod za posamezno točko

% stopnja bezierove krivulje
n = size(b, 2) - 1;

A = zeros(n + 1, length(t));
for i = 0: n
    A(i + 1, :) = bernsteinPolyOdvod(n, i, t);
end
B = b * A;

plot(B(1,:),B(2,:))
hold on
end