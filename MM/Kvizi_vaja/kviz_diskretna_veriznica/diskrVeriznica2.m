function x_min = diskrVeriznica2(w0,obesisceL,obesisceD,L,M)
% function x_min = diskrVeriznica2(w0,obesisceL,obesisceD,L,M)
% diskrVeriznica2 resi problem diskretne veriznice (vrne samo x komponento minimuma): preko fsolve najde u in v, tako da
% F(u,v) = [0; 0], nato veriznico narise.
% Po knjigi Matematicno modeliranje (E. Zakrajsek).
% vhod:
% w0 = [u0;v0] zacetna priblizka,
% obesisceL = [x_0;y_0],
% obesisceD = [x_n+1;y_n+1],
% L = dolzine palic (vektor).
% M = mase palic (vektor).
% izhod:
% x je 2x(n+2) tabela koordinat vozlisc.
% definiramo vsote_mi
% glej (3.13)
mi = zeros(1, length(M) - 1);
for i = 1:length(M) - 1
   mi(1, i) = (M(i) + M(i+1)) / 2;
end

vsota_mi = cumsum([0, mi]);
% iskanje nicle F(u,v) = [U(u,v);V(u,v)]
F = @(w) F_uv1(w, obesisceL, obesisceD, L, vsota_mi);
w = fsolve(F, w0);
% izracunamo x-e

% glej (3.16) ter (3.18), (3.19) ter (3.8) in (3.9)
ksi = [];
eta = [];
x = [zeros(1, length(vsota_mi)); zeros(1, length(vsota_mi))];
n = length(L);
f = @(j) w(2) - (w(1) * vsota_mi(j));
for i = 1: length(vsota_mi)
    ksi(i) = L(i) / ((1 + (f(i))^2)^0.5);
    eta(i) = ksi(i) * f(i);
    x(1, i) = obesisceL(1) + sum(ksi(1: i));
    x(2, i) = obesisceL(2) + sum(eta(1: i));
end

x = [obesisceL(1), x(1,:);
     obesisceL(2), x(2,:)];

x_min = min(x(2, :));
% narisemo veriznico

plot(x(1,:),x(2,:),'ro-','LineWidth',2,'MarkerSize',8,'MarkerFaceColor','r');