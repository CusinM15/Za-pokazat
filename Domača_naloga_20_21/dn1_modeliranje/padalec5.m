function v = padalec5(parametri, zac, tk, n, a)
% function [y,v,t] = padalec(parametri,zac,tk,n)
% Simulacija vertikalnega padanja padalca v odvisnosti od zacetne hitrosti
% in zracnega upora.
% Vhod:
% parametri = [m,c,S], m je masa, c je koeficient upora (prib. 1 za
% obicajen skok in skakalca), S presek padalca pravokotno na smer padanja
% zac = [y0;v0] sta zacetna visina in zacetna hitrost
% tk je koncni cas, do katerega gledamo padanje (pred odprtjem padala!!!)
% n je stevilo enakomerno razporejenih casovnih trenutkov opazovanja
% Za gostoto zraka privzamemo ro=1.3 kg/m^3, tezni pospesek g=9.8 m/s^2
% Izhod:
% y so visine padalca ob casih t (vektor dolzine n)
% v so hitrosti padalca ob casih t (vektor dolzine n)
% t je vektor casovnih trenutkov
t = linspace(0, tk, n);
f_Y = @(t,Y) diferencialniSistem5(t, Y, parametri, a);
[nekej, Y] = ode45(f_Y, t, zac);
v = Y(end, 2);


function F = diferencialniSistem5(t, Y, parametri, a)
% function F = diferencialniSistem(t,Y,parametri)
% Opisuje sistem dif. enacb za padalca pri navpicnem padu.
% Vhod:
% t je cas, Y = [y1;y2]
% Prva komponenta Y(1) predstavlja pozicijo.
% Druga komponenta Y(2) predstavlja hitrost.
% parametri = [m,c,S]
% Izhod:
% dY je sistem NDE, vrnemo desno stran sistema dY = F(t,Y)
ro_vis = @(k)((Y(1) - 40000) / 40000) ^ k;
ro = a(1) + a(2) * ro_vis(2) + a(3) * ro_vis(4);
g0 = 9.81;
r = 6371000;
c = parametri(2);
S = parametri(3);
m = parametri(1);
g = g0 * (r / (r +  Y(1))) ^ 2;
hitrost = Y(2);
pospesek = -g - ro * c * S * abs(Y(2)) .* Y(2) / (2 * m);
F = [hitrost; pospesek];