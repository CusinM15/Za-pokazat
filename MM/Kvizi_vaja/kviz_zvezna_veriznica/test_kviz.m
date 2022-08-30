% Homogeno vrv dolžine 20 na levem koncu obesimo 
% v točko T0(0,5), na desnem pa v točko T1(5,3).Odgovorite na naslednja vprašanja.
obesisceL = [0, 5];
obesisceD = [5, 3];
L = 20;
tol = 10 ^(-6);
%T_min = zvVeriznica(obesisceL,obesisceD,L,tol); 
% Vmes vrne odgivir na
    % Pri x=2 je ordinata točke na vrvi enaka y=
    % Premica y=x preseka vrv pri  y=
    
% Vrv doseže najnižjo točko pri  x=
%T_min(1) % drugo vprašanje kviz

% Kolikšna je dolžina daljšega dela vrvi, ki nastane, ko jo preprežemo s premico y=4 
% 4 odgovor izpiše vmes
%T_min1 = zvVeriznica1(obesisceL,obesisceD,L,tol); 

% Kolikšna bi morala biti ordinata točke T1, da bi bila najnižja točka vrvi pri  x=2.5
%5 odgovor -> moral sem desno obesišče razbiti na dva dela, drugače se je
%matlab pritoževal
%b = obesisceD(1);
%fsolve(@(p) zvVeriznica2(obesisceL, b, (p), L, tol) - 2.5, 3)