function x = n_kotnik(r, n)
% function x = n_kotnik(r, n)
% vrne koordinate pravilnega n kotnika
koti = zeros(1, n);
x = zeros(2, n);
x(1, 1) = 2 * r;
x(2, 1) = r;
% prvi element je že pravi
kot_premik = 2 * pi / n;
for i = 2: n
    prej = koti(i - 1);
    koti(i) = prej + kot_premik;
    x(1, i) = cos(koti(i)) * r + r;
    x(2, i) = sin(koti(i)) * r + r;
end
if rem(n, 2) == 1
    % zato, da nedobimo navpičnih stranic
    x = [0, -1; 1, 0] * x;
    x(1, :) = x(1, :) + 2 * r;
end