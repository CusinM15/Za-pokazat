function [y,v,t]=padalec_mir(parametri,zac,tk,n)
%PADALEC_MIR izracuna visine padalca ob ustreznih casih
%samo visino in hitrost v vertikalni smeri
%[y,v,t]=PADALEC_MIR(parametri,zac,tk,n)
%parametri=[m,c,S]
%zac=[y0;v0] sta zacetna visina in zacetna hitrost
%m je masa, c je koeficient upora (prib. 1 za normalen skok), S presek padalca pravokotno
%na smer padanja
%za gostoto zraka privzamemo ro=1.3 kg/m^3, tezni pospesek g=9.8 m/s^2
%tk je koncni cas, do katerega gledamo padanje (pred odprtjem padala!!!)
%n je stevilo enakomerno razporejenih casovnih trenutkov opazovanja
%y so visine padalca ob casih t (obe kolicini sta vektorja dolzine n)
%v so hitrosti padalca ob casih t

t=linspace(0,tk,n);
dY=@(t,Y) sistem(t,Y,parametri);
[t,Yres]=ode45(dY,t,zac);
% visine in hitrosti padalca
y=Yres(:,1);
v=Yres(:,2);

function dY=sistem(t,Y,parametri)
%SISTEM opisuje sistem dif. enacb za padalca pri navpicnem padu
%dY=SISTEM(t,Y,parametri)
%t je cas, Y=[y1;y2]=[x;v]
%Prva komponenta Y(1) predstavlja pozicijo
%Druga komponenta Y(2) predstavlja hitrost
%Isti sistem kot zgoraj
%parametri=[m,c,S]

ro=1.35;
g=9.81;
m=parametri(1);
c=parametri(2);
S=parametri(3);
K=1/2*ro*c*S;
% Funkcija f na desni strani sistema NDE: y' = f(t,y)
% Opomba: Ce je hitrost pozitivna, je sila upora negativna in obratno.
%         Zato namesto y(2).^2 uporabimo -abs(y(2)).*y(2).
dY=[Y(2);-g- K/m*abs(Y(2)).*Y(2)];
end
end



