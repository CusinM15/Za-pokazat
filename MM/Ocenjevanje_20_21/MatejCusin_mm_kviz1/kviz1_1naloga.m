format long
g = @(x, y) 2 *(exp(-4 * ((x - 2.1)^2 + (y - 3)^2)) + exp(-4 * ((x - 1)^2 + (y - 2)^2))+exp(-3 * ((x - 4)^2 + (y - 2)^2)));
f =@(x, y) sin(sin(x + y)) + g(x, y);
x = linspace(0, 5, 101);
y = linspace(0, 5, 101);
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
%pozicija(1)
sez1 = [];
sez2 = [];
for j = 1: 101
    for i = 1: 101
        sez1(i) = f(x(i), y(j));
    end
    sez2(j) = min(sez1);
end
% 2
%max(sez2)
razlika = 0;
sez = [];
for i = 1: 101
    for j = 1: 101
        sez(j) = f(x(i), y(j));
    end
    raz1 = max(sez) - min(sez);
    if raz1 > razlika
        razlika = raz1;
    end
end
%razlika
sez3 = [];
k = 1;
for j = 1: 101
    for i = 1: 101
        vre = f(x(i), y(j));
        if vre < 0.5
            sez3(k) = vre;
            k = k + 1;
        end
    end
end
mean(sez3)