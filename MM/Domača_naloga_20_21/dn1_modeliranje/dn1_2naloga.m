format long
zac = [40000; 0];
m = 105;
c = 1;
S = 1.2;
parametri = [m, c, S];
tk = 300;
n = 10000;
% 1 naloga
[y1, v1, t1] = padalec1(parametri, zac, tk, n);
%mean(v)
% 2 naloga
[y2, v2, t2] = padalec2(parametri, zac, tk, n);
%y2(end)

% metoda najmanjših kvadratov: 
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
ro_vis = @(k, h)((h - 40000) / 40000) ^ k;
ro = @(h) a(1) + a(2) * ro_vis(2, h) + a(3) * ro_vis(4, h);
cas_vis = zeros(11, 1);
for i = 1: 11
    cas_vis(i) = ro(visina(i));
end

%plot(visina, gostota, 'bo', visina, cas_vis, 'r')
[y3, v3, t3] = padalec3(parametri, zac, tk, n, a);
% 3 naloga
%y3(end)
%zadnji 2 decimalki drugačni

tk4 = 30;
% brez odriva
[y41, v41, t41] = padalec3(parametri, zac, tk4, n, a);
zac4 = [40000; -3];
[y42, v42, t42] = padalec3(parametri, zac4, tk4, n, a);
% 4 naloga
%v42(end) - v41(end)

fun1 = @ (tk) padalec5(parametri, zac, tk, n, a);
fun2 = @(t) fun1(t) + 300;
% 5 naloga
%fsolve(fun2, 10)


