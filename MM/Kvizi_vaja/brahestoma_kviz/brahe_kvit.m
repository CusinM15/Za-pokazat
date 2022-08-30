format long
% Naj bo A=41. Kroglica se giblje iz tocke T1=(0,0) v tocko T2=(5+A/100,−2) po najhitrejsi poti in nato iz T2 v T3=(8,−5) 
% po premici pod vplivom konstantnega gravitacijskega pospeska (brez trenja).
A = 41;
T1 = [0; 0];  
T2 = [5 + (A / 100); -2];
T3 = [8; -5];
% 3tja naloga se tu izpise
    % Gibanje kroglice od T1 do T2 opazujemo v 1000 enakomerno razporejenih casovnih 
    % intervalih. Kaksna je (priblizno) x koordinata kroglice, ko je y koordinata 
    % (priblizno) na sredini med ordinatama T1 in T2 (na 6 mest natancno)? 
cas_braheo = brahistohrona1(T1, T2);
% premica
T3 = T3 - T2;
T2 = [0; 0];
k_pre = (T3(2) - T2(2)) / (T3(1) - T2(1));
y = @(x) k_pre .* x + T2(2) - k_pre * T3(1);
f = @(x) ((1 + k_pre ^ 2) ./ (2 * 9.8 .* abs(y(x)))) .^ 0.5;
cas_prem = integral(f, 0, T3(1)); 
% 1
% Koliko casa potrebuje kroglica, da pride iz T1, skozi T2 v T3 (na 6 mest natancno)?
%round(cas_braheo + cas_prem, 6)
T2b = [5 + (A / 100); -2];
T3b = [8; -5];
%cas_braheo2b = brahistohrona1(T2b, T3b);
% 2 round(7) je sprejelo 6 pa ne
% Za koliko casa se skrajsa potovanje, ce kroglica potuje od T1 do T2 po brahistohroni 
% in nato od T2 do T3 spet po brahistohroni (na 6 mest natancno)?
%round(cas_prem - cas_braheo2b, 7)

