function ver = rojstni_dan_analiticno(N)
% function ver = rojstni_dan_analiticno(N)
%
% Funkcija vrne verjetnost, da imata vsaj dva v skupini N ljudi rojstni dan na isti dan
% v letu.
%
% ver je verjetnost, N je stevilo ljudi, poizkusov je stevilo ponovitev poskusa.

ver = 1;
for i = 0:N-1
   ver = ver * (365-i)/365;
end

ver = 1 - ver;
end