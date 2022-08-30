function ver = okuzeni(N, delezOkuzenih, stPoizkusov)
% function ver = okuzeni(N, verjetnostOkuzenih, stPoizkusov)
%
% Funkcija vrne verjetnost, da je v skupini N ljudi, vsaj ena oseba okuzena
% s prenosljivo boleznijo. Podatek delezOkuzenih \in [0,1] pove delez
% okuzenih ljudi v celotni populaciji. Z argumentom stPoizkusov dolocimo
% stevilo ponovitev simulacije.

ver = 0;

for i = 1:stPoizkusov
    st = rand([1,N]);
    uni = min(st);
    
    if uni <= delezOkuzenih
       ver = ver + 1; 
    end
end

ver = ver / stPoizkusov;
end