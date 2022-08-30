format long
f =@(x, y) sin(cos(x + y)) + exp(-(x - 1) ^ 2 - (y - 1) ^ 2);
fx = @(X) -2 * exp(-(X(1) - 1) ^ 2 - (X(2) - 1) ^ 2) * (X(1) - 1) - cos(cos(X(1) + X(2)))*sin(X(1) + X(2));
fy = @(Y) -2 * exp(-(Y(1) - 1) ^ 2 - (Y(2) - 1) ^ 2) * (Y(2) - 1) - cos(cos(Y(1) + Y(2)))*sin(Y(1) + Y(2));
x = linspace(0, 5, 100);
y = linspace(0, 5, 100);
[x2d, y2d] = ndgrid(x, y);
z = [];
maks = 0;
pozicija = [0, 0];
negativne = [];
k = 1;
for i = 1: 100
    for j = 1: 100
        vre = f(x(i), y(j));
        if vre > maks
            maks = vre;
            pozicija(1) = x(i);
            pozicija(2) = y(j);
        elseif vre < 0
            negativne(k) = f(x(i), y(j));
            k = k + 1;
        end
    end
end
%1
%norm(pozicija)
%2
%mean(negativne)
razlika = 0;
for i = 1: 99
    for j = 1: 100
        vre1 = f(x(i), y(j));
        vre = f(x(i + 1), y(j));
        raz1 = abs(vre1 - vre);
        if  raz1 > razlika
            razlika = raz1;
        end
    end
end
%3
%razlika
x = 3;
y = 4;
to = [x, y];
odx = fx(to);

ody = fy(to);
grad = @(X)[fx(X); fy(X)];
normala = [-odx, -ody, 1] / (odx ^ 2 + ody ^ 2 + 1) ^ 0.5;
%4
% normala(1)
w0 = [0.4, 0.4];
rez = fsolve(grad, w0);
norm(rez)
%samo 4 decimalke prav


%plot3(x, y, z)