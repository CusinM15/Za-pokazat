function presecisce_y = zvVeriznicaPresecisce(obesisceL,obesisceD,L,tol)
% function presecisce_y = zvVeriznicaPresecisce(obesisceL,obesisceD,L,tol)
% Funkcija vrne y koordinato presecisca z y = 2x
%
% Jacobijeva iteracija za enacbo (15)
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

kje = fzero(@(x)w(x) - 2 * (x), 0);
presecisce_y = 2 * kje;

% zvVeriznica(obesisceL, obesisceD, L, 1e-6)
end