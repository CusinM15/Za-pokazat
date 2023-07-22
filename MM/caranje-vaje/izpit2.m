format long
g = @(x,y) 2.0*(exp(-4.0*((x-2.00).^2 + (y-3.20).^2)) + exp(-4.0*((x-1.0).^2 + (y-2.0).^2)) + exp(-3.90*((x-4.0).^2 + (y-2.0).^2)));
f = @(x,y) sin(sin(x+y)) + g(x,y);
x = linspace(1, 5, 101);
y = linspace(1, 5, 101);
[x2d, y2d] = ndgrid(x, y);
z2d = f(x2d,y2d)
mm = max(z2d);
od11 = 0;
for i = 1: 3
  [kl, j] = max(mm);
  od11 = od11 + kl;
  mm(j) = 0;
end
od11
  