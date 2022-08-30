function hitrosti = brahistohrona1(T1,T2)
% function hitrost = brahistohrona1(T1,T2)
% Funkcija narise brahistohrono za robni tocki T1 in T2 in vrne hitrosti za linspace(0, theta).
% vhod
% T1=[x_1;y1]; T_2=[x_2;y_2]
% naredimo premik tock "v izhodisce":
T2 = T2 - T1;
b = T2(1);
B = T2(2);
% poiscemo optimalni theta (in pripadajoci k)
[theta, k] = poisciOpt_theta_k(b, B);
% definiramo diskr. vrednosti parametricne krivulje v odvisnosti od parametra theta
y = @(theta) k ^ 2 / 2 * (cos(theta) - 1);
%zapis hitrosti
t = linspace(0, theta);
hitrosti = (2 * 9.81 * abs(y(t))) .^ 0.5;

