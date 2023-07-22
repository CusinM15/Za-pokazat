function ver = okuzeni_analiticno(N, delezOkuzenih)
% function ver = okuzeni_analiticno(N, verjetnostOkuzenih)
%
% Funkcija vrne verjetnost, da je v skupini N ljudi, vsaj ena oseba okuzena
% s prenosljivo boleznijo. Podatek delezOkuzenih \in [0,1] pove delez
% okuzenih ljudi v celotni populaciji. Z argumentom stPoizkusov dolocimo
% stevilo ponovitev simulacije.

ver = 1 - (1-delezOkuzenih)^N;

end