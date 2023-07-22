x = 0:.01:1;
y = 0:.01:2;
f= @(x,y)sin(x.^2-y.^4) ./ (x.^2-y.^4);
[x2d, y2d] = ndgrid(x, y);
z = f(x2d, y2d);
z(abs(sin(x2d.^2-y2d.^4) ./ (x2d.^2-y2d.^4)) < 10^-6)=1;
surf(x2d, y2d, z)