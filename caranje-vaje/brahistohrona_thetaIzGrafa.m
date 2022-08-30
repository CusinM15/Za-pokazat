function cas = brahistohrona_thetaIzGrafa(T1, T2)
% function cas = brahistohrona(T1,T2)
% Funkcija narise brahistohrono za robni tocki T1 in T2 in vrne cas potovanja kroglice po njej.
% vhod
% T1=[x_1;y1]; T_2=[x_2;y_2]
% naredimo premik tock "v izhodisce":
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
t = linspace(0, theta);
%plot(x(t) + premik(1), y(t) + premik(2))

cas = k * theta / (2 * 9.81) ^ 0.5;



