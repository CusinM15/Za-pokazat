format long
% bezier

b0=[0,5]';
b1=[-0.92,3]';
b2=[0,0]';
b3=[0.9,2]';
b4=[0,4.06]';
b5=[3,6]';
kontrolne_b=[b0,b1,b2,b3,b4,b5];
% 1 vprašanje
%odgovor31 = norm(bezierOdvod(kontrolne_b, 0.5));
% 2 vprasanje
% recimo, da je najbolj oddaljena tocka tocka b(0.5) ker vemo da je oddaljenoost do izhodisca ravno norm(bezier(kontrole:b,0.5))
%razdaljaDo = [2;5];
%vektorIzhodisce = bezier(kontrolne_b, 0, 5);
%odgovor32 = norm(vektorIzhodisce - razdaljaDo) %ocitno ne

% zvezna veriznica
L=12.30;
T21=[0.50;7.0];
T22=[4.0;6.10];
tol = 10 ^(-6);
L2=L +2;
[lambda1, D1, C1] = zvVeriznicaVrniFunkcijo(T21, T22, L, tol);
w1 = @(x) lambda1 + cosh((x-D1)/C1)*C1;
[lambda2, D2, C2] = zvVeriznicaVrniFunkcijo(T21, T22, L2, tol);
w2 = @(x) lambda2 + cosh((x-D2)/C2)*C2; % tako smo dobili ustrezni funkciji
x1 = 0.5;
x2 = 4;
funkcija_ploscina_vmes = @(x)abs(w1(x)-w2(x));
odgovor22 = integral(funkcija_ploscina_vmes, x1, x2);
dolLeviKrak = zvVeriznicaDol(T21, T22, L, tol);
odgovor23 = L - dolLeviKrak;

% padalec
zac = [10106; 0];
m = 197;
c = 1;
S = 1.6;
parametri = [m, c, S];
tk1 = 30;
tk3 = 100;
n = 100000;



% metoda najmanj?ih kvadratov: 
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

% 11
[y1, v1, t1] = padalec_mir(parametri, zac, tk1, n);

odg1 = zac(1)-min(y1)

% 12

odg2 = min(v1)

% 13
m2 = 93;
c2 = 3;
S2 = 8;
parametri2 = [m2, c2, S2];
[y2, v2, t2] = padalec_mir(parametri, zac, tk3, n); % za cas 100s
visinaPoPadu = [y2(end);0];
[y3, v3, t3] = padalec_mir(parametri2, visinaPoPadu, 812, n);
