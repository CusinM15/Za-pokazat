format long

% 1 naloga

L = 12.0;
T11 = [0.7; 7.0];
T12 = [4.0; 6.0];
T13 = [T11(1); T11(2) - 1];
T14 = [T12(1); T12(2) + 2]; 
tol = 10 ^(-6);
m1 = zvVeriznica(T11, T12, L, tol);
hold on
m2 = zvVeriznica(T13, T14, L, tol);
odgovor11 = norm(m1 - m2);
hold off
[lambda1, D1, C1] = zvVeriznicaVrniFunkcijo(T11, T12, L, tol);
w1 = @(x) lambda1 + cosh((x-D1)/C1)*C1;
[lambda2, D2, C2] = zvVeriznicaVrniFunkcijo(T13, T14, L, tol);
w2 = @(x) lambda2 + cosh((x-D2)/C2)*C2;
preFun = @(x)w1(x) - w2(x);
presecisceX = fzero(preFun, 1);
odgovor12 = w1(presecisceX);
x1 = 0.7;
x2 = 4.0;
odgovor13 = integral(w1, x1, x2);
lDol = L / 5;
lTab = [lDol];
mTab = [1];
for i = 2: 5
  lTab(i) = lDol;
  mTab(i) = 1;
end
% te naloge pa nerazumem kaj je sploh treba zracunat spodaj nekaj neuspeluh poiskusov
%dis1 = diskrVeriznica([-1, 1], T11, T12, lTab, mTab);
%hold on
%dis2 = diskrVeriznica([-1, 1], T13, T14, lTab, mTab);
%abs(min(dis1(2, :)) - m1(2)) + abs(min(dis1(2, :)) - m2(2))
%odgovor14 = abs(min(dis1(2, :)) - min(dis2(2, :)))
% abs(m1(2) - m2(2)) po navodilh tko uastopm

% 2 naloga

b0 = [0.0; 0.0];
b1 = [1.90; 0.0];
b2 = [2.0; 3.10];
b3 = [1.0; 0.0];
b4 = [2.10; -1.0];
b5 = [2.80; 0.0];
kontrolne_b = [b0, b1, b2, b3, b4, b5];
B = bezier(kontrolne_b,0.5)