format long

% 1 NALOGA
T0 = [2.3, 3]';
T1 = [6, 1.8]';
g = 9.81;
M = [1.0, 2.0, 5.0, 1.8, 1.0, 2.0];
L = [1.0, 1.5, 1.0, 1.4, 1.0, 1.0];
% 1 vprašanje
%odgovor11 = diskrVeriznica1([-1; -1], T0, T1, L, M, g)

L2 = [];
M2 = [];
j = 1;
for i = 1: length(M)
    dol_i = L(i);
    mas_i = M(i);
    L2(j) = dol_i / 3;
    M2(j) = mas_i / 3;
    j = j + 1;
    L2(j) = dol_i / 3;
    M2(j) = mas_i / 3;
    j = j + 1;
    L2(j) = dol_i / 3;
    M2(j) = mas_i / 3;
    j = j + 1;
end
% 2 vprašanje
% x2 = diskrVeriznica([-1; -1], T0, T1, L2, M2);
% odgovor12 = min(x2(2, :))

% 3 vprašanje
%odgovor13 = diskrVeriznica1([1; 1], T0, T1, L, M, g)


M4 = @(p)[1.0, 2.0, p, 1.8, 1.0, 2.0];
f = @(p)(diskrVeriznica1([-1; -1], T0, T1, L, M4(p), g) - 120);
odgovor14 = fsolve(f, pi);
% izpiše 26.269315826886874 (pri približku 0), 26.269315838972030 (pri pi),
% 26.269315895040400 (pri 2pi)
% zakaj ni prav nimam pojma, spodaj je slika pri tej vrednosti in
% potencialna energija pri tej teži (1.199999999315540e+02)
% diskrVeriznica([-1; -1], T0, T1, L, M4(26.269315826886874));
% diskrVeriznica1([-1; -1], T0, T1, L, M4(26.269315826886874), g)


% 2 NALOGA
T02 = [1.9, 5.7]';
T12 = [6.5, 3.4]';
% uporaba pri 2 vprašanju in med izvajanjem izpiše napačen odgovor nna 1.
cas1 = brahistohrona(T02, T12); % izpiše 3.320971745051544 za prvo pa mi glede na sliko to zdi prav

T22 = [7, 3.4]';
T22 = T22 - T02;
T12 = T12 - T02;
T02 = [0; 0];
hitrost = (2 * g * abs(T12(2))) .^ 0.5;


cas2 = (T22(1) - T12(1)) / (hitrost);
% 2 vprašanje
%odgovor22 = cas1 + cas2


T02a = [1.9, 5.7]';
Tn = @(x) [x, 5.7]';
T12a = [6.5, 3.4]';
% g = @(x) brahistohrona(T02a, Tn(x)) + brahistohrona(Tn(x), T12a)
% x = linspace(T02a(1), T12a(1));
% y = [];
% for i = 1: length(x)
%     k  = x(i);
%     y(i) = g(k)
% end
% y
%min(fsolve(g(x)))

% 4 vprašanje
% f4 = @(x) (brahistohrona(T02a, Tn(x)) - brahistohrona(Tn(x), T12a));
% odgovor24 = fsolve(f4, 2 * pi)

% 5 vprašanje
%odgovor25 = brahistohrona1_kviz(T02a, T12a, 1)

