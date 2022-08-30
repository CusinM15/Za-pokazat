function B = bezier(b,t)
% function B = bezier(b,t)
% bezier izracuna tocke na bezierovi krivulji pri parametrih t. Bezierova
% krivulja je dolocena z 2D kontrolnimi tockami b=[bx0 bx1,...,bxn; by0,by1,...,byn]
% B vsebuje tocke na krivulji, B je dimenzije 2 * length(t).

% stopnja bezierove krivulje
n = size(b,2)-1;
% B = zeros(2,length(t));

A = zeros(n+1,length(t));
for i=0:n
    A(i+1,:) = bernsteinPoly(n,i,t);
end
B = b*A;

plot(B(1,:),B(2,:))
hold on
end