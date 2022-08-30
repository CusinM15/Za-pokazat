function odgovor_na5 = brahistohrona2(T1, T2, cas)
% function odgovor_na5 = brahistohrona2(T1, T2, cas)
% Funkcija narise brahistohrono za robni tocki T1 in T2 in še doriše do točke tako, da bo čas 1.5. 
% vrne normo točke da bo braheostroma sovpadala od T1 do T2 tako, da bo čas
% natančno cas, ki je podan kot parameter.
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
% poračuna najprej nov theta, da bo čas ustrezen.
nov_theta = cas * (2 * 9.81) ^ 0.5 / k;
odgovor_na5 = norm([x(nov_theta)+ premik(1), y(nov_theta) + premik(2)]);
% narisemo krivulji
t = linspace(0, nov_theta);
plot(x(t) + premik(1), y(t) + premik(2), 'b')
hold on
t1 = linspace(0, theta);
plot(x(t1) + premik(1), y(t1) + premik(2), 'ro')


