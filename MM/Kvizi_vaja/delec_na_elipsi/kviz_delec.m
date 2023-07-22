format long
seme = 47;
rand('seed', seme);
a = 6 + rand(1);

x = @(t) a * cos(t);
y = @(t) (a + 1) * sin(t);

% Kako daleč od točke O(0,0) je delec ob času t=2–√?
% 1. vprasanje
t = 2 ^ 0.5;
odgovor1 = norm([x(t); y(t)]);

% Kdaj je delec najbližje točki T(12,5)?
% 2. vprasanje
T = [12; 5];
r = @(t) ((x(t) - 12) ^ 2 + (y(t) - 5) ^ 2) ^ 0.5;
odgovor2 = fmincon(r, 0, 1, 1);

% Koliko je najmanj oddaljen od točke T(12,5)?
% 3. vprasanje: razdalja od T(12,5)
odgovor3 = norm([x(odgovor2); y(odgovor2)] - T);

% Abscisa točke, kjer delec preseka krivuljo y=exp(x) v prvem kvadrantu, je
% 4. vprasanje
y4 = @(x) exp(x);
F = @ (X) [x(X(1)); y(X(1))] - [X(2);y4(X(2))];
presecisce = fsolve(F, [0,0]);
odgovor4 = presecisce(2);