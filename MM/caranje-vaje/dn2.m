format long

% 1 NALOGA diskretna verižnica
T0 = [1, 5]';
T1 = [6, 2]';
g = 9.81;
M = [1, 2, 1, 2, 1, 2, 1, 2];
L = [1, 1.5, 1, 1.5, 1, 1.5, 1, 1.5];
x = diskrVeriznica([-1; -1], T0, T1, L, M);
sredisce = length(M) / 2 + 1; % za četrto vprašanje
% 1 vprašanje
%odgovor11 = mean(x(1, :))

% 2 vprašanje
%odgovor12 = diskrVeriznica1([-1; -1], T0, T1, L, M, g)
L3 = [];
M3 = [];
j = 1;
for i = 1: length(M)
    dol_i = L(i);
    mas_i = M(i);
    L3(j) = dol_i / 2;
    M3(j) = mas_i / 2;
    j = j + 1;
    L3(j) = dol_i / 2;
    M3(j) = mas_i / 2;
    j = j + 1;
end
% 3 vprašanje
%x3 = diskrVeriznica([-1; -1], T0, T1, L3, M3);
%odgovor13 = min(x3(2, :))

% 4 vprašanje
L1 = L(1: sredisce - 1);
M1 = M(1: sredisce - 1);
L2 = L(sredisce: end);
M2 = M(sredisce: end);
vmes = @(p)[x(1, sredisce); x(2, sredisce) + p];
f = @(p)(diskrVeriznica1([-1; -1], T0, vmes(p), L1, M1, g) + diskrVeriznica1([-1; -1], vmes(p), T1, L2, M2, g) - 180);
%odgovor14 = fsolve(f, 0)

% 5 vprašanje
T11 = [8.5,0]';
T00 = [1, 5]';
w0 = [-1; -1];
tocke = diskrVeriznica(w0, T00, T11, L, M);
tocke(tocke < 0) = 0; 
kje = find(tocke(2,:)==0);
prva_nicla = tocke(:, kje(1));
prva_nicla(1) = tocke(1, end) - sum(L(kje(1): end));
% da vidimo sliko
x = diskrVeriznica(w0, T00, prva_nicla, L(1:kje(1) - 1), M(1: kje(1) - 1));
hold on
x = diskrVeriznica([1; 1], prva_nicla, T11, L(kje(1): end), M(kje(1): end));
%odgovor15 = diskrVeriznica1(w0, T00, prva_nicla, L(1:kje(1) - 1), M(1: kje(1) - 1), g)


% 2 NALOGA braheostoma
% 1 vprašanje
%odgovor21 = brahistohrona(T0, T1)

% potrebujem pri računanju 3, 4 odgovora
%hitrosti = brahistohrona1(T0, T1);

% 3 vprašanje
%odgovor23 = hitrosti(end)

% 4 vprašanje
%odgovor24 = max(hitrosti)

% 5 vprašanje
%kol_casa = 1.5;
%odgovor25 = brahistohrona2(T0, T1, kol_casa)

% 2 vprašanje
T0 = [1, 5]';
T2 = [3, 2]';
T1 = [6, 2]';
% izračun časa od T0  do točke T2 
T2 = T2 - T0;
T1 = T1 - T0;
T0 = [0; 0];
k_pre1 = (T0(2) - T2(2)) / (T0(1) - T2(1));
y1 = @(x) k_pre1 .* x + T0(2) - k_pre1 * T0(1);
f1 = @(x) ((1 + k_pre1 ^ 2) ./ (2 * 9.81 .* abs(y1(x)))) .^ 0.5;
cas1 = integral(f1, 0, T2(1));
% ker imata naslednji dve točki enak y je treba upoštevati hitrost
hitrost = (2 * g * abs(T2(2))) .^ 0.5;
cas2 = (T1(1) - T2(1)) / (hitrost);
%odgovor22 = cas1 + cas2




