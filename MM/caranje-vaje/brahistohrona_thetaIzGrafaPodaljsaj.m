function normaTocka = brahistohrona_thetaIzGrafaPodaljsaj(T1, T2, cas)
% function toske = brahistohrona_thetaIzGrafaPodaljsaj(T1, T2, cas)
% vrne normo dejanske to?ke T2, ta to?ka se nahajja tako da braheostoma poteka 
% med to?kama podanima to?kama T1 in T2, tako, da ?as potovanja traja ravno toliko koliko je podan cas 
premik = T1;
T2 = T2 - T1;
b = T2(1);
B = T2(2);
% poiscemo optimalni theta (in pripadajoci k)
[theta, k] = poisciOpt_theta_k_thetaIzGrafa(b, B);
% definiramo diskr. vrednosti parametricne krivulje v odvisnosti od parametra theta
x = @(theta) k ^ 2 / 2 * (theta - sin(theta));
y = @(theta) k ^ 2 / 2 * (cos(theta) - 1);
% narisemo krivuljo
nov_theta = cas * (2 * 9.81) ^ 0.5 / k;
normaTocka = norm([x(nov_theta)+ premik(1), y(nov_theta) + premik(2)]);
% narisemo krivulji
t = linspace(0, nov_theta);
plot(x(t) + premik(1), y(t) + premik(2), 'b')
hold on
t1 = linspace(0, theta);
plot(x(t1) + premik(1), y(t1) + premik(2), 'ro')

%noviX = fzero(@(x) (9.81 * cas) ^ 2 ./ (x ^ 3) * (x - sin(x)), 6);
%noviY = fzero(@(y) (9.81 * cas) ^ 2 ./ (y ^ 3) * (cos(y) - 1), 2);
%cas = k * theta / (2 * 9.81) ^ 0.5;
%nov_theta = cas * (2 * 9.81) ^ 0.5 / k;
%tocka = [noviX; noviY] + premik
%NormaT2 = norm(tocka);


