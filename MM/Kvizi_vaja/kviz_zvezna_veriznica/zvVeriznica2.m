function T_min_x = zvVeriznica2(obesisceL, b, B, L, tol)
% function T_min_x = zvVeriznica2(obesisceL, b, B, L, tol)
% Vrne le x koordinato minimalne točke
% Funkcija zvVeriznica narise zvezno veriznico in poisce njeno najnizjo tocko.
%
% Po knjigi Matematicno modeliranje (E. Zakrajsek).
%
% Vhod
% obesisceL, obesisceD: levo in desno obesisce veriznice, obesisceL=[a;A], obesisceD=[b;B]
% L:                    dolzina
% tol:                  toleranca pri iteraciji
%
% Izhod
% T_min:                najnizja tocka veriznice
%
% Jacobijeva iteracija za enacbo (15)
z0 = 1;
a = obesisceL(1);
A = obesisceL(2);


z = zvVeriznica_iteracijskaFun(a, A, b, B, L, z0, tol);
% parametri v,u,D 
v = atanh(((B-A)/L))+z;
u = atanh(((B-A)/L))-z;
D = (a*v-b*u)/(v-u);

% najnizja tocka, iz (4), ko je cosh(0) = 1


T_min_x = D;

end