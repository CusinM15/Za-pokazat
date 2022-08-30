function [naDvehLetvah, priblizekPi] = buffonovaIgla(stPonovitev)

% Problem Buffonove igle, kjer je dolzina igle 1 in razdalja med letvami 1.

% stPonovitev je stevilo ponovitev poskusa

% naDvehLetvah je stevilo primerov, ko igla lezi na dveh letvah

% priblizekPi = 2*stPonovitev/naDvehLetvah

lezi_na_letvah = 0;
for i = 1:stPonovitev
    y_koordinata = rand(1);
    kot = rand(1)*2*pi;
    y_koncna = sin(kot) + y_koordinata;
    if (y_koncna > 1) |  (y_koncna <0)
        lezi_na_letvah = lezi_na_letvah + 1;
    end
end
  
naDvehLetvah = lezi_na_letvah;
priblizekPi = 2*stPonovitev/naDvehLetvah;
end