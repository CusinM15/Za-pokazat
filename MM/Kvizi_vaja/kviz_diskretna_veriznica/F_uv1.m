function z = F_uv1(w, obesisceL, obesisceD, L, vsote_mi)
% function z = F_uv(w,obesisceL,obesisceD,L,vsote_mi)
% F_uv vrne vrednost namenske vektorske funkcije za diskretno veriznico,
% z = F(w) = [U(u,v);V(u,v)], z \in R^2, w=(u,v) \in R^2
% Po knjigi Matematicno modeliranje (E. Zakrajsek).
% vhodni podatki:
% w=[u;v], kjer sta u in v parametra funkcije F(w) = F(u,v),
% obesisceL = levo obesisce [x_0;y_0],
% obesisceD = desno obesisce [x_n+1;y_n+1],
% L = dolzine palic (vektor),
% vsote_mi = [0,mi_1,mi_1+mi_2,...] je vektor delnih vsot mi-jev.
% izhodni podatki:
% z = F(w) = [U(u,v);V(u,v)] (glej (3.22) in (3.23)).
ksi = [];
eta = [];
n = length(L);
f = @(j) w(2) - w(1) * sum(vsote_mi(j));
for i = 1: length(vsote_mi)
    ksi(i) = L(i) / (1 + (f(i)) ^ 2) ^ 0.5;
    eta(i) = ksi(i) * f(i);
end 
U = sum(ksi) - (obesisceD(1) - obesisceL(1));
V = sum(eta) - (obesisceD(2) - obesisceL(2));
z = [U; V];


