format long

odstrani = [9, 23, 31, 41, 47];
dat = load('tab.mat');
mojDat = dat.tab;
podatki = zeros(45, 45);
for i = 1: 50
    if i ~= 9 && i ~= 23 && i ~= 31 && i ~= 41 && i ~= 47
        for j = 1: 50
            if j ~= 9 && j ~= 23 && j ~= 31 && j ~= 41 && j ~= 47
                podatki(i, j) = mojDat(i, j);
            end
        end
    end
end
  
 
% Vprašanje 1 ker spremeni matriko sem zakomentiral
% for k = 1: 9
%     % z zanko odstranjeval nejvečje
%     [maks, i] = max(podatki);
%     [elt, j] = max(maks);
%     podatki(i, j) = -elt;
% end
% odgovor11 = max(max(podatki));
odgovor12 = 0;
for i = 1: 45
    for j = 1: 45
        if rem(i + j, 2) == 0
            odgovor12 = odgovor12 + podatki(i, j);
        end
    end
end
odgovor12 % mogoče kasneje

% 2 naloga
T0 = [2.1, 3.0]';
T1 = [5.0, 2.0]';
L = [1.0, 1.5, 1.0, 1.0, 1.0, 1.0];
M = [1, 1, 1, 1, 1, 1];
w0 = [-1; -1];
% x = diskrVeriznica(w0, T0, T1, L, M);
% odgovor21 = min(x(2, :))  % ammm zakaj pa to ni prov?
L1 = [1.0, 1.5, 2.0, 1.0, 1.0];
M1 = [1, 1, 1, 1, 1];
w0 = [-1; -1];
% 23 tudi nedela
% x1 = diskrVeriznica(w0, T0, T1, L1, M1);
% kji = [];
% for i = 2: 6
%     kji(i) = abs(x(2, i) - x(2, i - 1) / x(1, i) - x(1, i - 1));
% end
% odgovor23 = max(kji)

% 3 naloga
L = 12.3;
T1 = [0.3, 7.0]; 
T2 = [4.0, 6.4];
tol = 10 ^(-6);
m1 = zvVeriznica(T1, T2, L, tol);
T3 = [0.3, 6.0]; 
T4 = [4.0, 8.4];
m2 = zvVeriznica(T3, T4, L, tol);
% odgovor31 = norm(m1- m2);
% odgovor32 = zvVeriznicaPresecisce(T1, T2, L, tol);
% odgovor33 = zvVeriznicaDol(T1, T2, L, tol);