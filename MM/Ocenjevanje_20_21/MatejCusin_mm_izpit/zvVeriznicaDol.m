function dolzina = zvVeriznicaDol(obesisceL,obesisceD,L,tol)
% function dolzina = zvVeriznicaDol(obesisceL,obesisceD,L,tol)
% Funkcija zvVeriznicaDol vrne dolžino do najnižje točke
z0 = 1;
a = obesisceL(1);
A = obesisceL(2);
b = obesisceD(1);
B = obesisceD(2);

z = zvVeriznica_iteracijskaFun(a,A,b,B,L,z0,tol);
% parametri v,u,C,D na koncu strani 4
v = atanh(((B-A)/L))+z;
u = atanh(((B-A)/L))-z;
C = (b-a)/(v-u);
D = (a*v-b*u)/(v-u);
% lambda, iz enacbe (5) ali (6)
lambda =  A-C*cosh((a-D)/C);
% funkcija w, enacba (4)
w = @(x) lambda + cosh((x-D)/C)*C;


dw = @(x) sinh((x - D) ./ C);
f = @(x) (1 + (dw(x)) .^ 2) .^ 0.5;



% graf veriznice

x = linspace(a,b,100);
dolzina = integral(f, a, D);
plot(x,w(x),'b','LineWidth',0.5)
hold on
plot([a,b],[A,B],'ko','MarkerSize',5,'MarkerFaceColor','r');

% najnizja tocka, iz (4), ko je cosh(0) = 1


T_min = [D; lambda + C];
plot(T_min(1),T_min(2),'ko','MarkerSize',5,'MarkerFaceColor','g');
grid on;
hold off
% zvVeriznica(obesisceL, obesisceD, L, 1e-6)
end