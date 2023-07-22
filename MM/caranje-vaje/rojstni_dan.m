function ver = rojstni_dan(N, poizkusov)
% function ver = rojstni_dan(N, poizkusov)
%
% Funkcija vrne verjetnost, da imata vsaj dva v skupini N ljudi rojstni dan na isti dan
% v letu.
%
% ver je verjetnost, N je stevilo ljudi, poizkusov je stevilo ponovitev poskusa.

ver = 0;

for i = 1:poizkusov
    rd = randi(365,[1,N]);
    uni = unique(rd);
    
    if length(rd) > length(uni)
        ver = ver + 1;
    end
end

ver = ver / poizkusov;

end

