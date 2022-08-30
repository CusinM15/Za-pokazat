% met ene kocke
% histogram(randi(6,[1, 1000]))
% met dveh kock hkrati
% histogram(sum(randi(6,[2, 1000])))

% pseudo nakljucna stevila
a = 13;
c = 0;
m = 31;
x0 = 1;
mojrand(1,8,a,c,m,x0);

% rojstni dnevi
N = 23;
poskusi = 100;
rojstni_dan(N, poskusi);
rojstni_dan_analiticno(N);

% okuženi
N = 10;
delezOkuzenih = 1/N;
stPoizkusov = 1000;
okuzeni(N, delezOkuzenih, stPoizkusov);
okuzeni_analiticno(N, delezOkuzenih);



