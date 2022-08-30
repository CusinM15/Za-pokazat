format long
% 1 NALOGA

% 2 NALOG
T1 = [0.09, 7.00]; 
T2 = [4.00, 5.57];
tol = 10 ^(-16);
L = 12.08;
T3 =[0.09; 6];
T4 = [4, 7.57];
m1 = zvVeriznica(T1, T2, L, tol);
m2 = zvVeriznica(T3, T4, L, tol);
% razlika dveh zveznih verižnic
odgovor21 = norm(m1- m2);

% ploščina (integral) zvezne verižnice od T1 do T2 na mejah integrala
odgovor22 = zvVeriznicaPloscina(T1, T2, L, tol, 0.09, 4.0); 

% ugotovi za koliko moramo premakniti T1 v levo da bo minimalna točka na
% višini 0
odgovor23 = fsolve(@(r) zvVeriznicaMinY(0.09 - r, 7, T2, L + r, tol), 4.4);


kje = 0;
dolz = L / 6;
M = ones(6, 1);
L = [dolz; dolz; dolz; dolz; dolz; dolz];

x = diskrVeriznica([-1; 1], T1, T2, L, M);

% za koliko je minimalna točka diskretne verižnice višja od minimalne
% višine zvezne verižnice
odgovor24 = min(x(2, :)) - m1(2);



% 3 NALOGA
 
%optimset('TolFun',1e-16)
b0 = [0, 5]';
b1= [-1, 3]';
b2 = [0, 0]';
b3 = [0.98, 2]';
b4 = [0, 3.92]';
b5 = [3, 6]';
kontrolne_b = [b0, b1, b2, b3, b4, b5];
n = size(kontrolne_b, 2) - 1;
kontrolneOdvod = n * (kontrolne_b(:, 2: end) - kontrolne_b(:, 1: (end - 1)));
% vrednost odvoda ob c=1
odgovor31 = norm(bezier(kontrolneOdvod, 1));

