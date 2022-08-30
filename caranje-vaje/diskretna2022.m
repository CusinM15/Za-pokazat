format long
T0 = [1; 5];  
T1 = [6; 2];
M = [1, 2, 1, 2, 1, 2, 1, 2];
L = [1, 1.5, 1, 1.5, 1, 1.5, 1, 1.5];
%tocke1 = diskrVeriznica([-1; 1], T0, T1, L, M);
%odgovor11 = mean(tocke1(1, :));
%odgovor12 = diskrVeriznica1([-1; 1], T0, T1, L, M, 9.81);
M3 = [];
L3 = [];
j = 1;
for i = 1:length(M)
    ms = M(i);
    ls = L(i);
    M3(j) = ms / 2;
    M3(j + 1) = ms / 2;
    L3(j) = ls / 2;
    L3(j + 1) = ls / 2;
    j = j + 2;
end
%tocke3 = diskrVeriznica([-5; -5], T0, T1, L3, M3);
%odgovor13 = min(tocke3(2, :));


g = 9.81;
x = diskrVeriznica([-1; 1], T0, T1, L, M);
sredisce = length(M) / 2 + 1; 


% 4 vprašanje
L1 = L(1: sredisce - 1);
M1 = M(1: sredisce - 1);
L2 = L(sredisce: end);
M2 = M(sredisce: end);
vmes = @(p)[x(1, sredisce); x(2, sredisce) + p];
f = @(p)(diskrVeriznica1([-1; 1], T0, vmes(p), L1, M1, g) + diskrVeriznica1([-1; 1], vmes(p), T1, L2, M2, g) - 180);
%odgovor14 = fzero(f, 0)

% 5 vprašanje
T11 = [8.5,0]';
T00 = [1, 5]';
w0 = [-1; 1];
tocke = diskrVeriznica(w0, T00, T11, L, M);
tocke(tocke < 0) = 0; 
kje = find(tocke(2,:)==0);
prva_nicla = tocke(:, kje(1));
prva_nicla(1) = tocke(1, end) - sum(L(kje(1): end));
% da vidimo sliko
%tocke = diskrVeriznica(w0, T00, T11, L, M);
%tocke(tocke < 0) = 0; 
%kje = find(tocke(2,:)==0);
%prva_nicla = tocke(:, kje(1));
%prva_nicla(1) = tocke(1, end) - sum(L(kje(1): end));
% da vidimo sliko
x = diskrVeriznica(w0, T00, prva_nicla, L(1:kje(1) - 1), M(1: kje(1) - 1))
hold on
xy = diskrVeriznica([-1; 1], prva_nicla, T11, L(kje(1): end), M(kje(1): end))
vsota = sum(x(2, :)) + sum(xy(2, :));
odgovor15 = vsota / (length(M) + 1)