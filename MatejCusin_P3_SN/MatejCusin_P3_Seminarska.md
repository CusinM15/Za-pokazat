# Tema: Najcenejše popolno prirejanje optavil in madžarska metoda z utežmi

# Seminarska naloga
Seminarska naloga temelji na tem, da je graf dvodelen. Dvodelen graf je tak graf, da lahko vozlišča razdelimo na dva dela (dela grafa poimenujemo X in Y), pri tem velja, da lahko iz X v Y pridemo zgolj po poteh lihe dolžine. Iz X v X pa zgolj po poteh sode dolžine.<br>
#### Kaj sploh je popolno prirejanje opravil?
Popolno prirejanje opravil pomeni to, da ima v dvodelnem grafu vsako vozlišče iz X natanko eno povezavo v Y, pri tem pa mora imeti vsako vozlišče v Y tudi natanko eno povezavo.<br>
Mi pa iščemo najcenejše popolno prirejanje. Idealno bi bilo, če bi lahko izbrali povezave s ceno 0, kar ponavadi ne drži, saj je cena za določeno opravilo ponavadi pozitivna vrednost.<br>
#### Redukcija matrike
Redukcija matrike pomeni, da v vsaki vrstici in v vsakem stolpcu odštejemo najmanjšo vrednost. To lahko storimo, ker bomo za vsakega delavca potrebovali najmanj toliko denarja, kot stane opravilo, ki bi ga najceneje opravil. Prav tako bomo za vsako opravilo plačali najmanj toliko, kolikor bo zaračunal najcenejši delavec.<br>
Izkaže se, da to vedno ne prinese rešitve, kadar pa pridemo do rešitve, lahko izberemo v vsaki vrstici in v vsakem stolpcu natanko eno ničlo. V primeru, ko do rešitve ne pridemo, lahko uporabimo madžarsko metodo z utežmi. Pri tej metodi moramo poiskati pokritje (izberemo stolpce in/ali vrstice), zato izberemo n-1 bodisi stolpcev bodisi vrstic (pri tem velja, da je matrika *n X n*). Potem poiščemo najmanjši nepokrit element (označimo epsilon) in potem nepokritim elementom odštejemo epsilon (ker smo izbrali minimum, pomeni, da so vsi elementi v matriki še vedno nenegativni). Elementom, ki pa so dvakrat pokriti (pomeni, da sta pokrita vrstica in stolpec, kjer se nahaja element) pa prištejemo epsilon. Izkaže se, da bo ta metoda vedno pripeljala do matrike kjer bomo lahko izbrali popolno prirejanje, kjer bodo vse cene poovezav 0. Ugotovili smo, kaj mora posamezni delavec opraviti, pravo ceno pa moramo prebrati iz začetne matrike.


# Opis projekta
Projekt dopušča, da si lahko uporabnik izbere matriko velikosti `2x2` ... `11x11`, v kateri potem določi imena delavcev in imena opravil. Potem pa s pomočjo madžarske metode z utežmi izračuna najcenejše popolno prirejanje. Madžarska metoda z utežmi najprej naredi redukcijo matrike, nato pa z uporabo madžarske metode brez uteži poišče bodisi najcenejše popolno prirejanje bodisi minimalno pokritje, na katerem potem lahko odšteje/prišteje epsilon.

# Težave
Največ težav sem imel z implementacijo madžarske metode brez uteži, saj pri tem, ko gradimo T ("množica", ki jo ustvarimo in potrebujemo pri iskanju povečujočih poti), si je treba zapomniti, iz katerega vozlišča smo prišli, ker lahko v posamezno vozlišče, ki je v T, pridemo iz več vozlišč. Na koncu sem ugotovil, da če si izberem zgolj prvo vozlišče, iz katerega lahko pridemo, se da dobiti rešitev.<br>
Risanje na drugem oknu mi je tudi povzročalo težave, toda s pomočjo profesorja mi je uspelo popraviti.
