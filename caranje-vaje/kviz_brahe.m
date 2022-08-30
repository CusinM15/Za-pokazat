format long

T0 = [1.2; 5.5];  
T1 = [6; 3];

odgovor21 = brahistohrona_thetaIzGrafa(T0, T1);
odgovor22 = brahistohrona_thetaIzGrafaNajnizjaTocka(T0, T1);

T14 = @(p) [p; 3];
f = @(p)(brahistohrona_thetaIzGrafa(T0, T14(p)) - 2);
odgovor24 = fzero(f, 0) %?

%odgovor25 = brahistohrona_thetaIzGrafaHitrostOb(T0, T1, 1) ?