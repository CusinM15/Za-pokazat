function bval = bernsteinPolyOdvod(n,j,t)
% function bval = bernsteinPolyOdvod(n,j,t)
% bernsteinPoly je Bernsteinov polinom
% n-stopnja, j-zaporedni polinom (0,1,..,n), t parameter (lahko vektor)
% bval je vrednost polinoma v t
% izračuna odvod!

bval=(nchoosek(n,j)*j*t.^(j-1) .* (1-t).^(n-j)) + (nchoosek(n,j)*t.^j .* (-(n-j).*(1-t).^(n-j-1)));

end