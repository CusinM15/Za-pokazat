format long
%1 NALOGA
% Uvod: Miklavz rabi pomoc pri statisticni analizi stroskov daril za otroke in pri 
% profiliranju otrok (njihove pridnosti). Naloga: Uvozite tabelo costs.mat v Matlab 
% (npr. z enim ukazom: load('costs.mat');, ali dvema ukazoma,kjer sami dolocimo ime 
% spremenljivke: mojaTabela = load('costs.mat'); mojaTabela = mojaTabela.costs;). 
%Tabela predstavlja podatke stroskov daril v evrih za 30 otrok za zadnjih 25 let 
% (otroci so razvrsceni po stolpcih, leta po vrsticah). 
% Naj b=4,9,12,14,16,18,19,20,21,22,23,25,26,27,29 predstavlja indekse izbranih otrok,
% katerih stroske zelimo pregledati. Pri vprasanjih se omejimo samo na to izbrano 
% mnozico otrok.
dat = load('costs.mat');
mojaTabela = dat.costs; 
b = [4, 9, 12, 14, 16, 18, 19, 20, 21, 22, 23, 25, 26, 27, 29];
minimum = 100;
maksimum = -1;
maks_razlika = [];
k = 1;
for i = b
    for j = 1: 25
         st = mojaTabela(j, i);
         if st > maksimum
             maksimum = st;
         elseif st < minimum
                minimum = st;
         end
    end
    min3 = min(mojaTabela(:, i));
    max3 = max(mojaTabela(:, i));
    maks_razlika(k) = max3 - min3;
    k = k + 1;
    
end
%1 vprašanje
% Koliksna je bila razlika med najvecjim najmanjsnim stroskom za darilo?
%maksimum - minimum

%3 vprašanje
% Sedaj iscemo otroka, ki je najbolj 'nihal v pridnosti': Koliksna je bila razlika 
% med najvecjim in najmanjsim stroskom darila za otroka, kjer je bila ta razlika 
% najvecja (povedano drugace: iscemo otroka, pri katerem je bila razlika dveh 
% stroskov daril najvecja, in zanima nas, koliksna je bila ta razlika)?
%max(maks_razlika)

omejitev = 10000;
sez_strosek = [];
k = 1;
rez = 0;
logicna = 1;
for j = 1: 25
    strosek = 0;
    for i = b
         st = mojaTabela(j, i);
         strosek = strosek + st;
         omejitev = omejitev - st;
         if omejitev < 0 & logicna == 1
            rez = sum(sez_strosek);
            logicna = 2;
         end
    end
    sez_strosek(k) = strosek;
    k = k + 1;
end
%2 vprašanje
% Koliksen je bil najvecji letni strosek (tj. strosek tistega leta, ko so bili 
% otroci najbolj pridni)?
%max(sez_strosek)

%4 vprašanje
% Zanima nas, do vkljucno katerega leta je bil celoten strosek daril manjsi 
% od 10000 evrov. Koliko je bil do vkljucno omenjenega leta celoten strosek daril
%rez


%2 NALOGA
% Diskretna veriznica je vpeta v tockah (0,10) in (10,10). Tla so na visini 0. 
% Deset palic, ki tvorijo veriznico, imajo zaporedne mase (od leve proti desni) 
% 6,1,8,1,7,10,4,8,7,10 in dolzine 1.2,1.6,2,1.3,1.5,1.6,1.4,1.5,1.8,1.1. 
% Denimo, da lahko palicam veriznice naknadno poljubno spreminjamo dolzine.
obesisceL = [0; 10];
obesisceD = [10; 10];
M = [6, 1, 8, 1, 7, 10, 4, 8, 7, 10];
L = [1.2, 1.6, 2, 1.3, 1.5, 1.6, 1.4, 1.5, 1.8, 1.1];
w0 = [-1; -1];
%x = diskrVeriznica1(w0,obesisceL,obesisceD,L,M)
% 1 vprašanje
% Poiscite najnizjo tocko veriznice za dane zacetne podatke. Koliksna je visina 
% (y-koordinata) tocke?

%min(x(2, :))

% L1 = @(p) [1.2, 1.6, 2, 1.3, 1.5 + p, 1.6 + p, 1.4, 1.5, 1.8, 1.1];
% 2 vprašanje
% Odlocimo se, da bomo spremenili dolzini tistih dveh palic, ki imata najnizjo 
% tocko veriznice iz prejsnjega vprasanja za skupno krajisce. Izbrani palici zelimo 
% podaljsati za enako vrednost p, tako da se veriznica ravno dotakne tal. 
% Koliksen je iskani podaljsek p?

% fsolve(@(p)diskrVeriznica2(w0,obesisceL,obesisceD,L1(p),M), 0)
 
% L2 = @(p) p .* [1.2, 1.6, 2, 1.3, 1.5, 1.6, 1.4, 1.5, 1.8, 1.1];
% 3 vprašanje
% Diskretni veriznici iz zacetnih podatkov zelimo podaljsati vse palice. Dolzina 
% palic se spreminja relativno (in ne absolutno kot pri prejsnjem vprasanju!), to 
% pomeni, da se vsaka palica raztegne za enak relativni koeficient. Koliksen je 
% iskan optimalni koeficient, ko se veriznica ravno dotakne tal?

% fsolve(@(p)diskrVeriznica2(w0,obesisceL,obesisceD,L2(p),M), 0)