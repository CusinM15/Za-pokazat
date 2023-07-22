format long
% 1 naloga
T11 = @(x)[x; 5.1] ;
T12 = [4.9; 0.2]; 
g = 9.81;
t = 1.4;
kje = @(x)brahistohrona(T11(x), T12) - t;
%odgovor11 = fzero(kje, 1) %v matlabu bi mogl znat zra?unat

% 2 naloga
L = 12.7; 
T21 = [1; 7.0];
T22 = [4.0; 5.6];
T23 = [T21(1); T21(2) - 1];
T24 = [T22(1); T22(2) + 2]; 
tol = 10 ^(-6);
%m1 = zvVeriznica(T21, T22, L, tol);
%hold on
%m2 = zvVeriznica(T23, T24, L, tol);
%odgovor21 = norm(m1 - m2)
%hold off

premica = @(x)2 * x;
odgovor22 = zvVeriznicaPresecisceSPremico(T21, T22, L, tol, premica)

%odgovor23 = zvVeriznicaDol(T21, T22, L, tol)

% 3 naloga
B = 62;
L3 = 12;
T31 = [0; 6];
T32 = [4 + (B / 100); 3];
minTocka = zvVeriznica(T31, T32, L3, tol);
odgovor31 = norm(minTocka);
v0 = 3;
% ker gremo po premici s konstatno hitrostjo je ?as = dolzina premice/hitrost
odgovor32 = norm(T31 - T32) / v0;
potDoMinimuma = zvVeriznicaDol(T31, T32, L3, tol);
odgovor33 = potDoMinimuma / v0;
