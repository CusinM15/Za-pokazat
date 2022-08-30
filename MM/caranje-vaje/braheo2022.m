format long
% Predpostavimo, da je gravitacijski pospešek g konstantno enak 9.81. Dolo?ite krivuljo k med to?kama T0=[1,5]? in T1=[6,2]?, 
% kjer je ?as potovanja kroglice od T0 do T1 najkrajši. Za?etna hitrost kroglice je 0, trenja na krivulji ni.
T0 = [1; 5];  
T1 = [6; 2];
% 1 Kolikšen je ?as potovanja kroglice od T0 do T1 po krivulji k?
%odgovor21 = brahistohrona_thetaIzGrafa(T0, T1);
% vmes ozpiše tudi odgovor na 23 in odgovor na 24

% 2 Izra?unajte ?as potovanja kroglice po odsekoma linearni krivulji, ki poteka skozi to?ke T0, [3,2]? in T1.
T0p = [1; 5]; 
zacetna_tocka = [3; 2]; 
T1p = [6; 2];
% premica 1
T2prestavljen = zacetna_tocka - T0p;
T0p = [0; 0];
k_pre = (T2prestavljen(2) - T0p(2)) / (T2prestavljen(1) - T0p(1));
y = @(x) k_pre .* x + T0p(2) - k_pre * T2prestavljen(1);
f = @(x) ((1 + k_pre ^ 2) ./ (2 * 9.81 .* abs(y(x)))) .^ 0.5;
cas_prem1 = integral(f, 0, T2prestavljen(1)); 
hitrost = (2 * 9.81 * abs(T2prestavljen(2))) .^ 0.5;
cas_prem2 = (T1p(1) - zacetna_tocka(1)) / (hitrost);
odgovor22 = cas_prem1 + cas_prem2;


cas = 1.5;
odgovor25 = brahistohrona_thetaIzGrafaPodaljsaj(T0, T1, cas)



