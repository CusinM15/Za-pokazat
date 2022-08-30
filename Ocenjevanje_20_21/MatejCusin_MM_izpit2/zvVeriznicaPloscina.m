function pl = zvVeriznicaPloscina(obesisceL, obesisceD, L, tol, od, do)
% function pl = zvVeriznicaPloscina(obesisceL, obesisceD, L, tol, od, do)
% vrne ploščino zvezne verižnice obešena obesisceL in obesisceD
% plođčino pa izračuna od, do (meje integrala)
z0 = 1;
a = obesisceL(1);
A = obesisceL(2);
b = obesisceD(1);
B = obesisceD(2);

z = zvVeriznica_iteracijskaFun(a,A,b,B,L,z0,tol);
% parametri v,u,C,D na koncu strani 4
v = atanh(((B-A)./L))+z;
u = atanh(((B-A)./L))-z;
C = (b-a)./(v-u);
D = (a.*v-b.*u)./(v-u);
% lambda, iz enacbe (5) ali (6)
lambda =  A-C.*cosh((a-D)./C);
% funkcija w, enacba (4)
w = @(x) lambda + cosh((x-D)./C).*C;
pl = integral(w, od, do, 'ArrayValue', true);


% najnizja tocka, iz (4), ko je cosh(0) = 1


% zvVeriznica(obesisceL, obesisceD, L, 1e-6)
end