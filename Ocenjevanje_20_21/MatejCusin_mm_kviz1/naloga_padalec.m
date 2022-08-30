format long
% metoda najmanjših kvadratov: 
visina = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000]';
gostota = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996]';
A = zeros(11, 3);
for i = 1: 11
    A(i, 1) = 1;
    A(i, 2) = ((visina(i) - 40000) / 40000) ^ 2;
    A(i, 3) = ((visina(i) - 40000) / 40000) ^ 4;
end
Ax = A' * A;
bx = A' * gostota;
a = lusolve(Ax, bx);
ro_vis = @(k, h)((h - 40000) / 40000) ^ k;
ro = @(h) a(1) + a(2) * ro_vis(2, h) + a(3) * ro_vis(4, h);
cas_vis = zeros(11, 1);
for i = 1: 11
    cas_vis(i) = ro(visina(i));
end
zac = [40000; 0];
m = 93;
c = 0.92;
S = 1;
parametri = [m, c, S];
tk = 20;
n = 10000;
% 1 naloga
[y1, v1, t1] = padalec2_1(parametri, zac, tk, n, a);
%pov_hitr = mean(v1)
m2 = m + 80;
c2 = c * 2;
tk2 = 30;
parametri2 = [m2, c2, S];
%breu
[y12, v12, t12] = padalec2_1(parametri, zac, tk2, n, a); 
%s prijateljem
[y2, v2, t2] = padalec2_1(parametri2, zac, tk2, n, a);
% 2 naloga
%y12(end) - y2(end)

% 4 naloga
[y14, v14, t14] = padalec2_1(parametri, zac, 1000, n, a); 
for i = 100: 10000
  if y14(i)  <= 0
    t14(i)
    break
  endif
  end
  
