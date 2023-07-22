zac = [0;0];
m = 100;
c = 1;
S = 2;
parametri = [m, c, S];
g = 9.8;
ro = 1.3;
tk = 10;
n = 10000;
[y,v,t] = padalec(parametri,zac,tk,n);
figure; hold on
plot(t, y)
K = 1/2*ro*c*S;
padalecpozicija = @(t)-log(cosh(sqrt(g*K/m)*t))*m/K;
padalechitrost = @(t)-sqrt(g*m/K)*tanh(sqrt(g*K/m)*t);
t0 = linspace(0, tk, n);
y0 = padalecpozicija(t0);
plot(t0, y0, 'r*')