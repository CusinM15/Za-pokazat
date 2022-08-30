function verjetnost = monty_hall(n, stVrat, strategija)
% function verjetnost = monty_hall(n, stVrat, strategija)
%
% Simuliramo problem Monty Hall (imamo vec vrat (v originalu troje), za eno je glavna nagrada, npr. avto, za preostalimi koze).
%
% n je stevilo ponovitev poskusa,
% stVrat je stevilo vrat,
% strategija=0: vztrajamo pri prvi izbiri vrat
% strategija=1: zamenjamo vrata
%
zadeli = 0;
for i = 1:n
    nagrada = randi(stVrat);
    izbira = randi(stVrat);
    if strategija == 1
        vsa_vrata = [1: stVrat];
        for j = vsa_vrata
            if j ~= nagrada &&  j ~= izbira
                vsa_vrata = setdiff(vsa_vrata, j);
                break
            end
        end
        se_mozni = setdiff(vsa_vrata, izbira);
        nova_izbira = randi(length(se_mozni));
        nova_izbira = se_mozni(nova_izbira);
        if nova_izbira == nagrada
            zadeli = zadeli + 1;
        end
        
        
    else
        if izbira == nagrada
            zadeli = zadeli + 1;
        end
    end
    
verjetnost = zadeli / n;
end