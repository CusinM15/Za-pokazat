function decast_demo(kontrolne,t)
% decast_demo(kontrolne, t) narise Bezierovo krivuljo
% kontrolne je tabela 2x(n+1), t je vektor parametrov v domeni

% tabela tock na bez. krivulji
B = zeros(2,size(t,2));
for i=1:size(t,2)
    tabela = decast(kontrolne,t(i));
    B(:,i) = tabela(1,end,:);
end

% narisemo krivuljo
plot(kontrolne(1,:),kontrolne(2,:),'k--o','LineWidth',1)
hold on
plot(B(1,:),B(2,:),'-','MarkerSize',5)
hold off
end