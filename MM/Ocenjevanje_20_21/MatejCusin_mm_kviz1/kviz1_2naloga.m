visina = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000]';
gostota = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996]';
A = zeros(11, 3);
for i = 1: 11
    A(i, 1) = 1;
    A(i, 2) = ((visina(i) - 40000) / 40000) ^ 2;
    A(i, 3) = ((visina(i) - 40000) / 40000) ^ 4;
end
Ax = A' * A;
bx = A' * gostota;
a = lusolve(Ax, bx);
format long
zac = [40000; 0];
m = 96;
c = 1;
S = 1.1;
parametri = [m, c, S];
tk = 200;
n = 10000;
[y1, v1, t1] = padalec1k(parametri, zac, tk, n);
%1
%max(abs(v1))

polozaj_drona = @(t)10000 + 10 * t;
%2
%y1(end) - polozaj_drona(tk)

ro_vis = @(k, h)((h - 40000) / 40000) ^ k;
ro = @(h) a(1) + a(2) * ro_vis(2, h) + a(3) * ro_vis(4, h);
%3
%fzero(@(h) ro(h) - 0.5, 1)
tk4a = 300;
[y4a, v4a, t4a] = padalec3k(parametri, zac, tk4a, n, a);
c4b = 5;
S4b = 1.1 * 10;
parametri4b = [m, c4b, S];
zac4b = [y4a(end); v4a(end)];
tk4b = 100;
[y4b, v4b, t4b] = padalec3k(parametri4b, zac4b, tk4b, n, a);
y4b(end)