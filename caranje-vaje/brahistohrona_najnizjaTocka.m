function min_y = brahistohrona_najnizjaTocka(T1, T2)
% function min_y = brahistohrona_najnizjaTocka(T1, T2)
% Funkcija narise brahistohrono za robni tocki T1 in T2 in vrne y najnizje tocke
% vhod
% T1=[x_1;y1]; T_2=[x_2;y_2]
% naredimo premik tock "v izhodisce":
premik = T1;
T2 = T2 - T1;
b = T2(1);
B = T2(2);
% poiscemo optimalni theta (in pripadajoci k)
[theta, k] = poisciOpt_theta_k(b, B);
% definiramo diskr. vrednosti parametricne krivulje v odvisnosti od parametra theta
x = @(theta) k ^ 2 / 2 * (theta - sin(theta));
y = @(theta) k ^ 2 / 2 * (cos(theta) - 1);
% narisemo krivuljo
t = linspace(0, theta);
%plot(x(t) + premik(1), y(t) + premik(2))
min_y = min(y(t) + premik(2))
% odgovor21 = min(- k ^ 2 / 2 * (sin(t) + 1)) + premik(2)
% cas = k * theta / (2 * 9.81) ^ 0.5;


