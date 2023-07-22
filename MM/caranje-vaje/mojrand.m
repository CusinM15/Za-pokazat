function P = mojrand(p,q,a,c,m,x0)
% function P = mojrand(p,q,a,c,m,x0)
%
% Funkcija vrne matriko psevdo nakljucnih stevil na podlagi 
% multiplikativnega kongruencnega
% generatorja. Generirana stevila so normirana na intervalu (0,1).
%
% P je matrika "nakljucnih" stevil dim. pxq
% a, c in m so parametri generatorja (veckratnik, zamik, modulo)
% x0 je zacetno stanje

f = @(x) mod(a * x + c, m);
P = zeros(p,q);
P(1,1) = x0;

for i = 1:p
   for j = 1:q
      if not(i == 1 && j == 1)
          P(i,j) = f(x0);
          x0 = P(i,j);
      end
   end
end

P = P / m;
end

