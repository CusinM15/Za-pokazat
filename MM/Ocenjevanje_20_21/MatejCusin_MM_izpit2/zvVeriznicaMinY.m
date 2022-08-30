function T_min_y = zvVeriznicaMinY(a, A, obesisceD, L, tol)
% function T_min_y = zvVeriznicaMinY(a, A, obesisceD, L, tol)
% Vrne le y koordinato minimalne točke zvezne verižnice

z0 = 1;
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
T_min_y = lambda + C;

end