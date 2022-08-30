function cas = brahistohrona1(T1,T2)
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
[theta, k] = poisciOpt_theta_k1(b, B);
% definiramo diskr. vrednosti parametricne krivulje v odvisnosti od parametra theta
x = @(theta) k ^ 2 / 2 * (theta - sin(theta));
y = @(theta) k ^ 2 / 2 * (cos(theta) - 1);
% narisemo krivuljo
t = linspace(0, theta, 1000);
polovica_y = abs(T2(2) / 2);
kdaj = 50;
id = -1;
for i = t
    if abs(abs(y(i)) - polovica_y) < kdaj
        kdaj = abs(abs(y(i)) - polovica_y);
        id = i;
    end
end
%3 vprasanje
%odgovor3 = x(id)

cas = k * theta / (2 * 9.8) ^ 0.5;
end

function [theta,k] = poisciOpt_theta_k1(b,B)
% function [theta,k] = poisciOpt_theta_k(b,B)
% Funkcija poisce netrivialen theta za brahistohrono, tako da g(theta)=0.

% Pogleg thete vrne tudi konstanto k.


% definiramo funkcijo g (konec strani 2)



% resimo nelin. enacbo (s funkcijo fzero) --> theta, k
g = @(theta) (1 - cos(theta)) + (B / b) * (theta - sin(theta));
theta = fzero(g, 2 * pi);
k = (2 * b / (theta - sin(theta))) ^ 0.5;


end