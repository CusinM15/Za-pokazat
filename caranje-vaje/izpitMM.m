format long

bC = [0     -0.92     0.00     0.98     0.00     3.00;    
     5.00     3.00     0.00     2.00     3.96     6.00];
% 1 vprašanje
odgovor31 = norm(bezierOdvod(bC, 0.5));

% zvezna veriznica
L=12.90;
T21=[0.50;7.0];
T22=[4.0;5.70];
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
odgovor23 = L - dolLeviKrak