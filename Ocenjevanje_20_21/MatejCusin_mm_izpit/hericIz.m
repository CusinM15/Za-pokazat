format long
T1 = [2.1; 3.0];
T2 = [5.0; 1.0];
L = [1, 1.5, 1, 1.2, 1, 1.4];
M = [1, 1.5, 1, 1.2, 1, 1.4];
x = diskrVeriznica([-1;-1], T1, T2, L, M);

odg21 = min(x(2,:));

razd = 0;
for i = 1:7
    if razd < norm(T1-[x(2*i-1), x(i*2)])
        razd = norm(T1-[x(2*i-1), x(i*2)]);
    end
end
odg22 = razd;

L1 = [1, 1.5, 2.2, 1, 1.4];
M1 = [1, 1.5, 2.2, 1, 1.4];
x2 = diskrVeriznica([-1;-1], T1, T2, L1, M1);

% 23 tudi nedela
x1 = diskrVeriznica([-1;-1], T1, T2, L1, M1);
k_ji = [];
for i = 2: 6
    k_ji(i - 1) = abs((x1(2, i) - x1(2, i - 1)) / (x1(1, i) - x1(1, i - 1)));
end
odgovor23 = max(k_ji)