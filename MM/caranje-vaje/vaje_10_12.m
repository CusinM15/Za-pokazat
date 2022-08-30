T1 = [1; 5];  
T2 = [7; 3];
cas_braheo = brahistohrona(T1, T2)
% premica
T2 = T2 - T1;
T1 = [0; 0];
k_pre = (T1(2) - T2(2)) / (T1(1) - T2(1));
y = @(x) k_pre .* x + T1(2) - k_pre * T1(1);
f = @(x) ((1 + k_pre ^ 2) ./ (2 * 9.81 .* abs(y(x)))) .^ 0.5;
cas_prem = integral(f, 0, T2(1))

% Brahistohrone s temenom
y = @(x) -T2(2)./(T2(1).^2) .* x.^2 + 2 .* T2(2)./(T2(1)) .* x;  
dy = @(x) -T2(2)./(T2(1).^2) .* 2 .* x + 2 .* T2(2)./(T2(1));
fp = @(x) ((1 + dy(x).^2) ./ (2 * 9.81 .* abs(y(x)))) .^ 0.5;
cas_parabole = integral(fp, 0, T2(1))

