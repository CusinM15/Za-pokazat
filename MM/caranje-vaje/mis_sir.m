vrstic = 5;   
stolpcev = 10;  
x = 1: vrstic: 1;
y = 1: stolpcev: 1;

a = peaks(10);
h = surf(a);
set(h, 'edgecolor','none')
hold on
[xx,yy] = meshgrid(x);
idx1 = isnan(xx)|isnan(yy);
a(idx1) = NaN;  
idx2 = ~isnan(xx)&~isnan(yy);
xx = reshape(xx(idx2),51,51);  % Reshape these guys.
yy = reshape(yy(idx2),51,51);
aa = reshape(a(idx2),51,51);
m = mesh(xx,yy,aa+.04);  % Create the net.
set(m,'edgecolor','black','facealpha',0,'linewidth',1)
set(1,'units','normalized','position',[.05 .05 .85 .85])
