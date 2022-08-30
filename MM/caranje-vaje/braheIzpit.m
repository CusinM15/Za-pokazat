format long
A = [0.40; 1.00];
B = [4.10; 0.00];
L = 5;
g = 9.81;
tol = 10 ^ (-16);
%brah_min_y = brahistohrona_najnizjaTocka(A, B);
%zvezna_min_tocka = zvVeriznica(A, B, L, tol)
%odg21 = abs(brah_min_y - zvezna_min_tocka(1));

%B3 = @(k) [4.1 + k; 0];
%novK = fzero(@(k) brahistohrona(A, B3(k)) - 1, 0)
%odg23 = abs(novK);
B4 = [4.1 - 0.789902792249062; 0];
dolzina = zvVeriznicaDol(A, B4, L, tol);
odg24 = (2 * dolzina / g) ^0.5