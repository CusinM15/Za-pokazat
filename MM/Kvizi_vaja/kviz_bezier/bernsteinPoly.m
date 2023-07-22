function bval = bernsteinPoly(n,j,t)
% function bval = bernsteinPoly(n,j,t)
% bernsteinPoly je Bernsteinov polinom
% n-stopnja, j-zaporedni polinom (0,1,..,n), t parameter (lahko vektor)
% bval je vrednost polinoma v t

bval=nchoosek(n,j)*t.^j.*(1-t).^(n-j);
end