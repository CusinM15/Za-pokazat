function tabela = decast(kontrolne,t)
% function tabela = decast(kontrolne,t)
% de Casteljauov algoritem za racunanje vrednosti na Bezierovi krivulji
% tabela je celotna de Casteljauova tabela velikosti (n+1)*(n+1)*2
% kontrolne je tabela kontrolnih tock krivulje velikosti 2*(n+1) (tocke po stolpcih)
% t je parameter, pri katerem izvajamo de Casteljauov alg.

[d,m] = size(kontrolne); % m = n+1;
tabela = zeros(m,m,d);
tabela(:,1,:) = kontrolne.';

for i = 2:m
    tabela(1:m-i+1,i,:) = (1-t)*tabela(1:m-i+1,i-1,:)+t*tabela(2:m-i+2,i-1,:);
end