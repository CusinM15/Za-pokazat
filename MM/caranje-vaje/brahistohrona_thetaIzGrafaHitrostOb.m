function hitrostOb = brahistohrona_thetaIzGrafaHitrostOb(T1, T2, cas)
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


y = @(theta) k ^ 2 / 2 * (cos(theta) - 1);
%zapis hitrosti

hitrost = @(t) (2 * 9.81 * abs(t)) .^ 0.5;

tockaOb = cas * (2 * 9.81) ^ 0.5 / k;
hitrostOb = hitrost(tockaOb);


