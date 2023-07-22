function aproksKroznice(kot1, kot2)
% function aproksKroznice(kot1, kot2)
%
% Aproksimacija enotskega kroznega loka s kubicno Bezierovo krivuljo.
% Krozni lok se zacne pri kotu kot1 in konca pri kotu kot2.
% Kubicna krivulja interpolira robni tocki kroznega loka (pri t=0 in t=1),
% hkrati pri omenjenih dveh tockah tangenti kubicne krivulje kazejo v isto
% smeri kot tangenti kroznice. 
% Prav tako pri t=1/2 krivulja interpolira srednjo tocko kroznega loka.

b0 = [cos(kot1); sin(kot1)]; % iz interpolacije prve tocke dolocimo b0
b3 = [cos(kot2); sin(kot2)]; % iz interpolacije zadnje tocke dolocimo b3

% zaradi ujemanje tangent na robu sta srednji kontrolni tocki
% b1 = b0 + d*[-sin(kot1); cos(kot1)],
% b2 = b3 - d*[-sin(kot2); cos(kot2)],
% kjer je d neznani parameter (zaradi simetrije predpostavimo, da je d enak za obe tocki)

% pri t=1/2 je vrednost Bezierovega polinoma enaka tocki na kroznici (resimo enacbo)
% b0*B0(1/2)+b1*B1(1/2)+b2*B2(1/2)+b3*B3(1/2)
% = 1/8(b0+3*b1+3*b2+b3)
% = 1/8(b0 + 3*(b0 + d*[-sin(kot1); cos(kot1)]) + 3*(b3 - d*[-sin(kot2); cos(kot2)]) + b3)
% = [cos(kot1/2+kot2/2),sin(kot1/2+kot2/2)]
% ter dobimo d

d = (8*cos(kot1/2+kot2/2) - b0(1) - 3*b0(1) - 3*b3(1) - b3(1))/(3*(-sin(kot1) + sin(kot2)));

% srednji kontrolni tocki
b1 = b0 + d*[-sin(kot1); cos(kot1)];
b2 = b3 - d*[-sin(kot2); cos(kot2)];

kontrolne = [b0 b1 b2 b3];

% tabela tock na bez. krivulji
t = linspace(0,1,200);
B = zeros(2,size(t,2));

for i=1:size(t,2)
    tabela = decast(kontrolne,t(i));
    B(:,i) = tabela(1,end,:);
end

% narisemo kroznico
tKr = linspace(kot1,kot2,200);
plot(cos(tKr),sin(tKr),'r','LineWidth',.5)
hold on
plot(cos(kot1/2+kot2/2),sin(kot1/2+kot2/2),'r*','LineWidth',.5)
% narisemo Bez. krivuljo
plot(kontrolne(1,:),kontrolne(2,:),'k--o','LineWidth',.5)
plot(B(1,:),B(2,:),'LineWidth',1)
hold off

axis equal