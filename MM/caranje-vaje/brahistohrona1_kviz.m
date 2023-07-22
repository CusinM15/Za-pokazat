function hitrost = brahistohrona1_kviz(T1, T2, cas)
% function hitrost = brahistohrona1_kviz(T1, T2, cas)
% Funkcija vrne hitrost ob željenem času.
% vhod
% T1=[x_1;y1]; T_2=[x_2;y_2]; cas
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
nov_theta = cas * (2 * 9.81) ^ 0.5 / k;
hitrost = (2 * 9.81 * abs(y(nov_theta))) .^ 0.5;



