format long
% Naj bo >>seme=731;rand('seed',seme);x2=2+rand(1); 
% Dani sta Bezierovi krivulji b:[0,1]→R2 s kontrolnimi točkami 
% b0=(0,1)T, b1=(1,2)T, b2=(3,2)T, b3=(4,−1)T ter c:[0,1]→R2 
% s kontrolnimi točkami c0=(0,0)T, c1=(1,−1)T, c2=(x2,−1)T, c3=(4,2)T. 
% Odgovorite na naslednja vprašanja.
seme = 731;
rand('seed',seme);
x2 = 2 + rand(1); 
b0 = [0, 1]';
b1 = [1, 2]';
b2 = [3, 2]';
b3 = [4, -1]';
c0 = [0, 0]';
c1 = [1, -1]';
c2 = [x2, -1]';
c3 = [4, 2]';
kontrolne_b = [b0, b1, b2, b3];
kontrolne_c = [c0, c1, c2, c3];
c = bezier(kontrolne_c, 0.5);
% Abscisa točke c(0.5) je
% 1 vprašanje
%odgovor1 = c(1)

% ∥c˙(0.5)∥2
% 2 vprašanje
%odgovor2 =  norm(bezierOdvod(kontrolne_c, 0.5))

% Oddaljenost točke c(0.5) od koordinatnega izhodišča je
% 3 vprašanje
%odgovor3 = norm(c)

% Predznačena ukrivljenost krivulje c v točki c(0.5) je
% 4 vprašanje
% stopnja bazierjeve funkcije
n = size(kontrolne_c, 2) - 1;
kontrolneOdvod = n * (kontrolne_c(:, 2: end) - kontrolne_c(:, 1: (end - 1)));
konOdvodBezier = bezier(kontrolneOdvod, 0.5);
% Predznačena ukrivljenost
% Kontrolne tocke za drugi odvod krivulje c (odvajamo prvi odvod)
kontrolneDrugegaOdvod = (n - 1) * (kontrolneOdvod(:, 2: end) - kontrolneOdvod(:, 1: (end - 1)));
konDrugiOdvodBezier = bezier(kontrolneDrugegaOdvod, 0.5);
% cross je operant za vektorski produkt
ukrivljenost = cross([konOdvodBezier; 0], [konDrugiOdvodBezier; 0])/norm(konOdvodBezier)^3;
% ker nas zanima predznačena ukrivljenost nas zanima le komponenta z
%odgovor4 = ukrivljenost(3)

% Abscisa presečišča krivulje c s premico y=1−x je
% 5 vprasanje: 
y = @(x) 1 - x;
t = linspace(0, 4, 100);
F = @(X) [X(1); y(X(1))] - bezier(kontrolne_c, X(2));
%presecisce = fsolve(F, [0, 0]);
%odgovor5 = presecisce(1)

% Ordinata presečišča krivulje b s krivuljo c je
% 6 vprasanje: 
% fb = @(x) bezier(kontrolne_b, x);
% fc = @(x) bezier(kontrolne_c, x);
% F = @(X) fb(X(1)) - fc(X(2));
% presecisce = fsolve(F, [1, 1]);
% tocka = bezier(kontrolne_b, presecisce(1));
% odgovor6 = tocka(2)